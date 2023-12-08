<?php
	# Fetch data from database and create an array of the healthtype data
	$data = dbFetch("SELECT ha_healthtype.typeid, ha_healthtype.name as type,ha_category.name as category,ha_units.name_short,ha_units.name_long,ha_units.unittype FROM ha_healthtype	LEFT JOIN ha_category ON ha_healthtype.category = ha_category.catid	LEFT JOIN ha_units ON ha_healthtype.unit = ha_units.unitid");
	$intesity = dbFetch("SELECT * FROM ha_intensity;");
	foreach ($data as $cat) {
		$list[$cat['category']][] = $cat;
	}

	if ($_POST) {
		$sql = "INSERT INTO ha_healthdata (uid, healthtype, amount, timestart, timeend, intensity) VALUES ";
		foreach ($list as $key=>$item) {
			foreach ($item as $content) {
				# Check if entry is of "time type", then calculate the duration from start and end time.
				if ($content['unittype'] == "Time" || $content['unittype'] == "time") {
					$firstTime=strtotime($_POST[$content['type'].'-timestart']);
					$lastTime=strtotime($_POST[$content['type'].'-timestop']);
					$_POST[$content['type']] = ($lastTime-$firstTime > 0) ? (($content['name_short'] == "h") ? (($lastTime-$firstTime)/3600) : (($lastTime-$firstTime)/60) ) : '';
				}

				# If amount is entered, the add it to query.
				if ($_POST[$content['type']]) {
					// $_POST[$content['type'].'-intesity'] = ($key == "Workout") ? $_POST[$content['type'].'-intesity'] : "null";
					$sql .= "('".$_SESSION['id']."','".$_POST[$content['type'].'-typeid']."',".number_format($_POST[$content['type']], 2, '.', '').",'".date('Y-m-d H:i', strtotime($_POST[$content['type'].'-timestart']))."','".date('Y-m-d H:i', strtotime($_POST[$content['type'].'-timestop']))."', 4),";
				}
			}
		}
		$r = dbQuery(substr($sql, 0, strlen($sql)-1));
		if ($r !== true) {
			echo $r;
		}
	}

	echo '<h2>'._('Add new measurements').'</h2>';
	echo '<p><i>'._('Multiple measurements can be added at the same time. Enter the values in the sections below.').'</p></i>';
	echo '<form id="measurements" action="?page=addmeasurements" method="post">';

	/* Build the form from the healthtype array
	 *  $tabList					The tabs for each healthtype (workout, helth etc)
	 *  $tabContent 			The content of each tab
	 *  $tabContentInner	The content of each subtab (pills) containing the forms
	 */
	$tabContent = '<div class="tab-content" id="v-pills-tabContent">';
	$tabContent .= '<div class="row">';

foreach ($list as $key => $item) {
    

    foreach ($item as $content) {
        $tabContent .= '<div class="col-sm-4 mb-3">';
        $tabContent .= '<div class="card mb-3 h-100 my-2">';
        $tabContent .= '<div class="card-body">';
        $tabContent .= '<h5 class="card-title">' . $content['type'] .'</h5>';
        $tabContent .= '<input type="hidden" name="' . $content['type'] . '-typeid" value="' . $content['typeid'] . '">';

        // Form Inputs
        $tabContent .= '<div class="mb-3">';
        $tabContent .= '<label class="form-label">' . _('From time') . '</label>';
        $tabContent .= '<div class="input-group">';
        $tabContent .= '<span class="input-group-text bi bi-envelope-fill"></span>';
        $tabContent .= '<input class="form-control" type="datetime-local" name="' . $content['type'] . '-timestart">';
        $tabContent .= '</div>';
        $tabContent .= '</div>';

        $tabContent .= '<div class="mb-3">';
        $tabContent .= '<label class="form-label">' . _('To time') . '</label>';
        $tabContent .= '<div class="input-group">';
        $tabContent .= '<span class="input-group-text bi bi-envelope-fill"></span>';
        $tabContent .= '<input class="form-control" type="datetime-local" name="' . $content['type'] . '-timestop">';
        $tabContent .= '</div>';
        $tabContent .= '</div>';

        // Add more form inputs based on your requirements
		if ($content['unittype'] != "Time" || $content['unittype'] != "time" ) {
			$strUnit = sprintf(_('Enter %s in %s'), $content['unittype'], $content['name_long']);
			$strIntensity = _('Select intensity');
		
			$tabContentInner = '<div class="col-12">';
			$tabContentInner .= '<label class="form-label">' . $strUnit . '</label>';
			$tabContentInner .= '<div class="input-group">';
			$tabContentInner .= '<span class="input-group-text bi bi-person-fill"></span>';
			$tabContentInner .= '<input class="form-control" type="number" name="' . $content['type'] . '" placeholder="' . $content['name_long'] . '" value="">';
			$tabContentInner .= '</div>';
			$tabContentInner .= '</div>';
		}
		
		if ($content['category'] == "Workout") {
			$tabContentInner .= '<div class="col-12">';
			$tabContentInner .= '<label class="form-label">' . $strIntensity . '</label>';
			$tabContentInner .= '<div class="input-group">';
			$tabContentInner .= '<span class="input-group-text bi bi-person-fill"></span>';
			$tabContentInner .= '<select class="form-select" name="' . $content['type'] . '-intensity">';
			
			foreach ($intesity as $select) {
				$tabContentInner .= ($select['typeid'] == $content['typeid']) ? '<option value="' . $select['iid'] . '">' . $select['name'] . '</option>' : '';
			}
		
			$tabContentInner .= '</select>';
			$tabContentInner .= '</div>';
			$tabContentInner .= '</div>';
		}

		$tabContent.=$tabContentInner;
		

        $tabContent .= '</div>'; // card
        $tabContent .= '</div>'; // col-md-6
    }

    $tabContent .= '</div>'; // row
}

$tabContent .= '</div>';


	echo $tabContent;
	echo '<br><button class="btn btn-primary" type="submit">' . _('Add measurements') .'</button>';
	echo '</form>';

?>

