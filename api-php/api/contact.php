<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');
if (['REQUEST_METHOD']==='OPTIONS') { http_response_code(200); exit; }
require_once __DIR__.'/../config/db.php';
\ = json_decode(file_get_contents('php://input'), true) ?: \;
\ = trim(\['name']??'');
\ = trim(\['email']??'');
\ = trim(\['phone']??'');
\ = trim(\['subject']??'');
\ = trim(\['message']??'');
if(empty(\)||empty(\)||empty(\)){ echo json_encode(['ok'=>false,'message'=>'Please fill required fields.']); exit; }
\=\->prepare('INSERT INTO contacts(name,email,phone,subject,message,created_at) VALUES(?,?,?,?,?,NOW())');
\->execute([\,\,\,\,\]);
echo json_encode(['ok'=>true,'message'=>'Message sent successfully.']);
