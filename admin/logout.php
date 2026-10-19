<?php
require_once dirname(__DIR__).'/config/env.php';
require_once dirname(__DIR__).'/includes/auth.php';
if (admin_passwordless_enabled()) {
    // In local demo mode, admin access is intentionally restored on the next request.
    header('Location: index.php');
    exit;
}
$_SESSION = [];
if (ini_get('session.use_cookies')) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000, $params['path'], $params['domain'], $params['secure'], $params['httponly']);
}
session_destroy();
header('Location: ../login.php');
exit;
