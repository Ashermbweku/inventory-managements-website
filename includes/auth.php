<?php
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

/**
 * Passwordless access is intended ONLY for a local classroom/demo installation.
 * Keep ADMIN_PASSWORDLESS=false on any publicly accessible server.
 */
function admin_passwordless_enabled(): bool {
    return strtolower((string) (getenv('ADMIN_PASSWORDLESS') ?: 'false')) === 'true'
        && strtolower((string) (getenv('APP_ENV') ?: 'production')) === 'local';
}

function admin_user(): ?array {
    if (!empty($_SESSION['admin']) && is_array($_SESSION['admin'])) {
        return $_SESSION['admin'];
    }
    if (admin_passwordless_enabled()) {
        $_SESSION['admin'] = [
            'id' => null,
            'name' => 'Local Demo Administrator',
            'email' => 'local-demo@localhost',
            'role' => 'Administrator (Local Demo)',
            'demo_mode' => true,
        ];
        return $_SESSION['admin'];
    }
    return null;
}

function require_admin(): void {
    if (!admin_user()) {
        header('Location: ../login.php');
        exit;
    }
}
