<?php
if (!empty($_POST)) {
	# Verify username/e-mail and password before quering database. Trow error if something went wrong.
	$username = (strpos($_POST['username'], "@") !== false) ? verifyData( $_POST['username'], "email", $abort_on_error = false) : verifyData( $_POST['username'], "name", $abort_on_error = false);
	$password = verifyData($_POST['password'], "password", $abort_on_error = false);

	if(empty($username) || (empty($password))) {
		$errLogin = _('Wrong username or password entered');
	} else {
		$prefix = DBPREFIX;
		$sql = <<<SQL
		SELECT ha_users.uid,username,email,urole,fname,lname,sex,height,birthdate,ha_lang.lang,ha_lang.code,ha_uimode.css FROM {$prefix}users
		LEFT JOIN ha_userdata ON ha_users.uid=ha_userdata.uid
		LEFT JOIN ha_lang ON ha_userdata.lang=ha_lang.langid
		LEFT JOIN ha_uimode ON ha_userdata.ui_mode=ha_uimode.id
		WHERE (ha_users.username='{$username}' OR ha_users.email='{$username}') AND  (BINARY ha_users.passwd='{$password}')
SQL;
		$row = dbFetch($sql);
		# If resulting query return a valid user, fetch user data and add it to the session.
		if ($row) {
			$row = $row[0];
			$_SESSION['username'] = $row['username'];
			$_SESSION['email'] = $row['email'];
			$_SESSION['id'] = (int) $row['uid'];
			$_SESSION['role'] = (int) $row['urole'];
			$_SESSION['firstname'] = $row['fname'];
			$_SESSION['lastname'] = $row['lname'];
			$_SESSION['gender'] = $row['sex'];
			$_SESSION['height'] = $row['height'];
			$_SESSION['theme'] = $row['css'];
			$_SESSION['lang'] = $row['code'];
			$_SESSION['birthdate'] = $row['birthdate'];
			header("Location: ?page=home"); # Om allt funkar omdirigeras användaren till dennes hemsida.
		} else {
			$errLogin = _('Wrong username or password entered');
		}
	}
}
?>

<div class='container'>

<div class="row align-items-center">
	<div class="col-md-6">
		<h1 class="display-4">Health Tracker App</h1>

	</div>
	<div class="col-md-6">
		<div class="card">
			<div class="card-body">
			
	<div class="text-black text-left">
		<h2>Welcome</h2>
		<h4>Login to continue</h4>
	</div>
	<?php
		if (isset($errLogin)) {
			echo '<div class="alert alert-danger"><strong>'._('Could not login to your account').'</strong><br>'.$errLogin."</div>";
		}
	?>
	<?php
		if (isset($_GET['reg'])) {
			echo '<div class="alert alert-success"><strong>'._('Your account has been created').'</strong><br>'._('Login with your credentials below')."</div>";
		}
	?>	<form id="loginForm" action="?page=login" method="post">
		<label><h5><strong><?php echo _('Username/e-mail') ?></strong></h5></label>
		<div class="input-group">
			<span class="input-group-text bi bi-person-fill"></span>
				<input class="form-control" type="text" name="username" placeholder="<?php echo _('Enter your username or e-mail..') ?>" required>
		</div><br>
		<label><h5><strong><?php echo _('Password') ?></strong></h5></label>
			<div class="input-group">
				<span class="input-group-text bi bi-key-fill"></span>
					<input class="form-control" type="password" name="password" placeholder="<?php echo _('Enter your password..') ?>" required>
			</div>
			<br>
		<button class="btn btn-primary btn-small w-100" type="submit"><?php echo _('Login') ?></button>
	</form>

	</div>
</div>
</div>
		</div>


</div>
