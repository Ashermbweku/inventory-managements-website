<?php
require_once 'config/db.php';
require_once 'includes/functions.php';
require_once 'includes/auth.php';
if (admin_passwordless_enabled()) {
    admin_user();
    header('Location: admin/index.php');
    exit;
}
if (!empty($_SESSION['admin'])) {
    header('Location: admin/index.php');
    exit;
}
$page_title='Admin Login';
include 'includes/header.php';
?>
<section class="auth-wrap"><div class="auth-card"><span class="eyebrow">Secure back office</span><h2>Administrator login</h2><p class="lead">Sign in to manage products, stock, suppliers, sales and reports.</p><form id="loginPane" class="ajax-form auth-pane" action="api/login.php" method="post" data-reload="1"><div class="form-group"><label for="email">Email</label><input id="email" class="form-control" type="email" name="email" data-required autocomplete="username" placeholder="admin@example.com"></div><div class="form-group"><label for="password">Password</label><input id="password" class="form-control" type="password" name="password" data-required autocomplete="current-password" placeholder="Enter password"></div><button class="btn btn-primary" type="submit"><i class="fa-solid fa-right-to-bracket"></i> Login</button></form></div></section>
<?php include 'includes/footer.php'; ?>
