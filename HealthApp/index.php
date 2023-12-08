<?php
	/* Setup everything, import configuration and connect to database
	 */
	include_once('config/config.php');
	include_once('include/functions.php');
	

	session_name(SESSIONID);
	session_start();
	setLanguage(isset($_SESSION['lang']) ? $_SESSION['lang'] : LANG);
	$_SESSION['role'] = isset($_SESSION['role']) ? $_SESSION['role'] : 0;

	# Add access log to database
	addLogData();
	$currentPage = '';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Health application</title>

		<!-- Import CCS styles -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/styles.css">
 		<!-- <link rel="stylesheet" href="assets/css/color_light.css"> -->

 		<!-- Import JS frameworks -->
 		<script src="assets/js/jquery-3.6.0.min.js"></script>
		<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/chart.min.js"></script>

		<!-- Enable collapse sidebar -->
		<script type="text/javascript">
			$(document).ready(function () {
				$("#sidebar").mCustomScrollbar({
					theme: "minimal"
				});

				$('#sidebarCollapse').on('click', function () {
					$('#sidebar, #content').toggleClass('active');
					$('.collapse.in').toggleClass('in');
					$('a[aria-expanded=true]').attr('aria-expanded', 'false');
				});
			});
		</script>
</head>

<body>
	<?php
		$menuStructure = array(
			array('title' => _('Dashboard'), 'icon' => 'bi-grid-1x2', 'page' => 'home', 'role' => [1,2]),
			array('title' => _('New measurement'), 'icon' => 'bi-stopwatch', 'page' => 'addmeasurements', 'role' => [2]),	
			array('title' => _('My goals'), 'icon' => 'bi-trophy', 'page' => 'usergoals', 'role' => [2]),
			array('title' => _('Account settings'), 'icon' => 'bi-gear', 'page' => 'usersettings', 'role' => [1,2]),
			array('title' => _('Register'), 'icon' => 'bi-person-plus-fill', 'page' => 'register', 'role' => [0]),
			array('title' => _('Login'), 'icon' => 'bi-box-arrow-in-right', 'page' => 'login', 'role' => [0]),
			array('title' => _('Logout'), 'icon' => 'bi-box-arrow-in-right', 'page' => 'logout', 'role' => [1,2]),
		);
	?>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">      
	<a class="navbar-brand" href="#">
	<?php echo $currentPage ?>           
        </a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <?php
                $page = verifyData(isset($_GET['page']) ? $_GET['page'] : 'login', "page", false);
                foreach ($menuStructure as $item) {
                    if (in_array($_SESSION['role'], $item['role'])) {
                        if (!isset($item['submenu'])) {
                            if ($item['page'] == '_head') {
                                echo '<p class="navbar-text">' . $item['title'] . '</p>';
                            } else {
                                echo '<li class="nav-item ' . ($item['page'] == $page ? 'active' : '') . '">';
                                echo '<a class="nav-link ' . '" href="?page=' . $item['page'] . '">' . $item['title'] . '</a>';
                                echo '</li>';
                                if ($item['page'] == $page) {
                                    $currentPage = $item['title'];
                                    $permit = in_array($_SESSION['role'], $item['role']);
                                }
                            }
                        } else {
                            $sublist = '';
                            $active = false;
                            foreach ($item['submenu'] as $subitem) {
                                if ($subitem['page'] == $page) {
                                    $active = true;
                                    $currentPage = $subitem['title'];
                                    $permit = in_array($_SESSION['role'], $item['role']);
                                }
                                $sublist .= '<li class="nav-item ' . ($subitem['page'] == $page ? 'active' : '') . '">';
                                $sublist .= '<a class="nav-link ' . '" href="?page=' . $subitem['page'] . '">' . $subitem['title'] . '</a>';
                                $sublist .= '</li>';
                            }
                            echo '<li class="nav-item dropdown">';
                            echo '<a class="nav-link dropdown-toggle ' . '" href="#" id="' . $item['page'] . 'Submenu" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="' . ($active ? 'true' : 'false') . '">';
                            echo $item['title'];
                            echo '</a>';
                            echo '<div class="dropdown-menu ' . ($active ? 'show' : '') . '" aria-labelledby="' . $item['page'] . 'Submenu">';
                            echo $sublist;
                            echo '</div></li>';
                        }
                    }
                }
                ?>
            </ul>
        </div>
    </div>
</nav>

	<div class="container-fluid">
		<div id="container-fluid">

			<div class="container">

			<!-- Import main page content  -->
			<?php
				if ($page) {
					if (!isset($permit)) {
						echo '<div class="alert alert-danger"><strong>'._('Access denied').'</strong><br>'._('You don\'t have the right to access this page.')."</div>";
					} else {
						include('pages/'.$page.'.php');
					}
				} else {
					echo '<div class="alert alert-danger"><strong>'._('Error 404').'</strong><br><br>'._('Requested page not found.')."</div>";
				}
			?>
			</div>

		</div>
	</div>
</body>
</html>
