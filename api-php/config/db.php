<?php
require_once __DIR__.'/env.php';
try {
    $dsn='mysql:host='.envv('DB_HOST','127.0.0.1').';port='.envv('DB_PORT','3306').';dbname='.envv('DB_NAME','inventory_manager_v2').';charset=utf8mb4';
    $pdo=new PDO($dsn, envv('DB_USER','root'), envv('DB_PASS',''), [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::ATTR_EMULATE_PREPARES=>false]);
} catch(Throwable $e){ http_response_code(500); die('Database connection failed. Check .env settings.'); }
