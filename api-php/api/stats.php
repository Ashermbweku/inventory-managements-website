<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');
if (['REQUEST_METHOD']==='OPTIONS') { http_response_code(200); exit; }
require_once __DIR__.'/../config/db.php';
require_once __DIR__.'/../includes/functions.php';
\ = dashboard_stats(\);
echo json_encode(['ok'=>true,'data'=>\]);
