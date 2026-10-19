<?php
function e($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function json_response($ok,$message,$data=[],$status=200){http_response_code($status);header('Content-Type: application/json');echo json_encode(['ok'=>$ok,'message'=>$message,'data'=>$data]);exit;}
function page_active($name){return basename($_SERVER['PHP_SELF'])===$name?'active':'';}
function token(){ if(session_status()!==PHP_SESSION_ACTIVE) session_start(); if(empty($_SESSION['csrf'])) $_SESSION['csrf']=bin2hex(random_bytes(24)); return $_SESSION['csrf']; }
function csrf_ok($value){ if(session_status()!==PHP_SESSION_ACTIVE) session_start(); return !empty($_SESSION['csrf']) && hash_equals($_SESSION['csrf'], (string)$value); }
function client_token(){ if(empty($_COOKIE['visitor_token'])){ $t=bin2hex(random_bytes(24)); setcookie('visitor_token',$t,time()+31536000,'/','','',true); $_COOKIE['visitor_token']=$t; } return $_COOKIE['visitor_token']; }
function upload_image($file,$folder){
  if(!$file || ($file['error']??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_OK) return null;
  $ext=strtolower(pathinfo($file['name'],PATHINFO_EXTENSION)); if(!in_array($ext,['jpg','jpeg','png','webp'])) throw new Exception('Only JPG, PNG and WebP images are allowed.');
  if(($file['size']??0)>5*1024*1024) throw new Exception('Image must be below 5 MB.');
  $name=date('YmdHis').'_'.bin2hex(random_bytes(5)).'.'.$ext; $dir=dirname(__DIR__).'/uploads/'.$folder; if(!is_dir($dir)) mkdir($dir,0775,true); move_uploaded_file($file['tmp_name'],$dir.'/'.$name); return 'uploads/'.$folder.'/'.$name;
}
