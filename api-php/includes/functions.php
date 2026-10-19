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
/* View-free data access (hosts without CREATE VIEW privilege, e.g. InfinityFree). */
function dashboard_stats(PDO $pdo): array {
  return $pdo->query("SELECT
    (SELECT COUNT(*) FROM products WHERE status='active') total_products,
    (SELECT COALESCE(SUM(quantity),0) FROM products WHERE status='active') stock_units,
    (SELECT COALESCE(SUM(quantity*buying_price),0) FROM products WHERE status='active') stock_value,
    (SELECT COALESCE(SUM(quantity*selling_price),0) FROM products WHERE status='active') retail_value,
    (SELECT COUNT(*) FROM products WHERE status='active' AND quantity<=minimum_stock) low_stock,
    (SELECT COUNT(*) FROM products WHERE status='active' AND quantity<=0) out_of_stock,
    (SELECT COUNT(*) FROM newsletter_subscribers WHERE status='active') subscribers,
    (SELECT COUNT(*) FROM contacts) enquiries,
    (SELECT COUNT(*) FROM blogs WHERE status='published') published_blogs,
    (SELECT COUNT(*) FROM events WHERE status='published' AND event_date>=CURDATE()) upcoming_events")->fetch() ?: [];
}
function stock_history(PDO $pdo, string $where='', array $params=[], int $limit=0): array {
  $sql="SELECT t.id,t.created_at,t.type,t.quantity,t.stock_before,t.stock_after,t.reason,t.reference_no,p.name AS product_name,p.sku,u.name AS user_name FROM stock_transactions t LEFT JOIN products p ON p.id=t.product_id LEFT JOIN users u ON u.id=t.user_id";
  if($where!=='') $sql.=' WHERE '.$where;
  $sql.=' ORDER BY t.created_at DESC';
  if($limit>0) $sql.=' LIMIT '.(int)$limit;
  $st=$pdo->prepare($sql); $st->execute($params); return $st->fetchAll();
}
function low_stock_rows(PDO $pdo): array {
  return $pdo->query("SELECT p.id,p.name,p.sku,p.quantity,p.minimum_stock,p.unit,c.name AS category FROM products p LEFT JOIN categories c ON c.id=p.category_id WHERE p.status='active' AND p.quantity<=p.minimum_stock ORDER BY p.quantity ASC,p.name")->fetchAll();
}

