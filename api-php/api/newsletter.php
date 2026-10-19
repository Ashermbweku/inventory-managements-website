<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');
if (['REQUEST_METHOD']==='OPTIONS') { http_response_code(200); exit; }
require_once __DIR__.'/../config/db.php';
\ = json_decode(file_get_contents('php://input'), true) ?: \;
\ = trim(\['email']??'');
if(!filter_var(\,FILTER_VALIDATE_EMAIL)){ echo json_encode(['ok'=>false,'message'=>'Invalid email.']); exit; }
try{\=\->prepare('INSERT INTO newsletter_subscribers(email,created_at) VALUES(?,NOW()) ON DUPLICATE KEY UPDATE status="active",created_at=NOW()');\->execute([\]); echo json_encode(['ok'=>true,'message'=>'Subscribed successfully.']);}catch(Exception \){ echo json_encode(['ok'=>true,'message'=>'Thanks for subscribing.']); }
