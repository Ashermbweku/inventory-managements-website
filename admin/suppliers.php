<?php
$admin_title='Supplier Management';
include '_header.php';
$pdo->exec("CREATE TABLE IF NOT EXISTS suppliers (id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, name VARCHAR(160) NOT NULL, contact_person VARCHAR(160) NULL, phone VARCHAR(60) NULL, email VARCHAR(160) NULL, address VARCHAR(255) NULL, notes TEXT NULL, status ENUM('active','inactive') NOT NULL DEFAULT 'active', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, INDEX idx_supplier_name(name)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$message='';
if($_SERVER['REQUEST_METHOD']==='POST'){
 if(!csrf_ok($_POST['csrf']??'')){ $message='Security token expired. Refresh and try again.'; }
 else {
  $action=$_POST['action']??'save'; $id=(int)($_POST['id']??0);
  if($action==='delete' && $id){$s=$pdo->prepare('DELETE FROM suppliers WHERE id=?');$s->execute([$id]);$message='Supplier deleted.';}
  else {
   $name=trim($_POST['name']??'');
   if($name==='') $message='Supplier name is required.';
   else { $vals=[$name,trim($_POST['contact_person']??''),trim($_POST['phone']??''),trim($_POST['email']??''),trim($_POST['address']??''),trim($_POST['notes']??'')];
    if($id){$vals[]=$id;$s=$pdo->prepare('UPDATE suppliers SET name=?,contact_person=?,phone=?,email=?,address=?,notes=? WHERE id=?');$s->execute($vals);$message='Supplier updated.';}
    else {$s=$pdo->prepare('INSERT INTO suppliers(name,contact_person,phone,email,address,notes) VALUES(?,?,?,?,?,?)');$s->execute($vals);$message='Supplier added.';}
   }
  }
 }
}
$suppliers=$pdo->query('SELECT * FROM suppliers ORDER BY status,name')->fetchAll();
?>
<?php if($message):?><div class="panel"><b><?=e($message)?></b></div><?php endif;?>
<div class="panel"><div class="panel-head"><div><h2>Add a Supplier</h2><small class="muted">Keep supplier contacts together for purchasing and deliveries.</small></div></div>
<form method="post"><input type="hidden" name="csrf" value="<?=token()?>"><div class="form-grid">
<div class="form-group"><label>Supplier / Company Name *</label><input class="form-control" name="name" required></div><div class="form-group"><label>Contact Person</label><input class="form-control" name="contact_person"></div>
<div class="form-group"><label>Phone</label><input class="form-control" name="phone" type="tel"></div><div class="form-group"><label>Email</label><input class="form-control" name="email" type="email"></div>
<div class="form-group full"><label>Address</label><input class="form-control" name="address"></div><div class="form-group full"><label>Notes</label><textarea class="form-control" name="notes"></textarea></div></div><p><button class="btn btn-primary" type="submit"><i class="fa-solid fa-plus"></i> Save Supplier</button></p></form></div>
<div class="panel"><div class="panel-head"><h2>Supplier Directory (<?=count($suppliers)?>)</h2></div><div class="table-wrap"><table><thead><tr><th>Supplier</th><th>Contact</th><th>Phone</th><th>Email</th><th>Address</th><th>Action</th></tr></thead><tbody>
<?php foreach($suppliers as $s):?><tr><td><b><?=e($s['name'])?></b><br><small><?=e($s['notes'])?></small></td><td><?=e($s['contact_person'])?></td><td><?=e($s['phone'])?></td><td><?=e($s['email'])?></td><td><?=e($s['address'])?></td><td><form method="post" onsubmit="return confirm('Delete this supplier?')"><input type="hidden" name="csrf" value="<?=token()?>"><input type="hidden" name="id" value="<?=$s['id']?>"><input type="hidden" name="action" value="delete"><button class="btn btn-danger" type="submit">Delete</button></form></td></tr><?php endforeach;?>
<?php if(!$suppliers):?><tr><td colspan="6">No suppliers added yet.</td></tr><?php endif;?></tbody></table></div></div>
<?php include '_footer.php'; ?>
