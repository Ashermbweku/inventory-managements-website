<?php
require '../../config/db.php';
require '../../includes/functions.php';
require '../../includes/auth.php';
require_admin();
if (!csrf_ok($_POST['csrf'] ?? '')) json_response(false,'Security token expired.',[],419);
$type=$_POST['type']??''; $allowed=['blogs','events','testimonials','services'];
if(!in_array($type,$allowed,true)) json_response(false,'Invalid content type.',[],422);
$id=(int)($_POST['id']??0);
try {
  if($type==='testimonials'){
    $vals=[trim($_POST['name']??''),trim($_POST['role']??''),trim($_POST['quote']??''),$_POST['status']??'published'];
    if($id){$vals[]=$id;$pdo->prepare('UPDATE testimonials SET name=?,role=?,quote=?,status=? WHERE id=?')->execute($vals);}
    else {$pdo->prepare('INSERT INTO testimonials(name,role,quote,status) VALUES(?,?,?,?)')->execute($vals);}
  } else {
    $img=upload_image($_FILES['image']??null,$type); $url=$img?:trim($_POST['image_url']??'');
    $title=trim($_POST['title']??''); $slug=trim($_POST['slug']??''); $excerpt=trim($_POST['excerpt']??''); $body=$_POST['body']??''; $status=$_POST['status']??'draft';
    if(strlen($title)<2 || strlen($slug)<2) json_response(false,'Enter a valid title and URL slug.',[],422);
    if($type==='blogs'){
      $vals=[$title,$slug,$excerpt,$body,$url,trim($_POST['category']??''),trim($_POST['favicon']??''),trim($_POST['keywords']??''),trim($_POST['seo_title']??''),trim($_POST['meta_description']??''),trim($_POST['og_title']??''),trim($_POST['og_description']??''),trim($_POST['og_image']??''),$status];
      if($id){$vals[]=$id;$pdo->prepare('UPDATE blogs SET title=?,slug=?,excerpt=?,body=?,image_url=?,category=?,favicon=?,keywords=?,seo_title=?,meta_description=?,og_title=?,og_description=?,og_image=?,status=?,published_at=COALESCE(published_at,NOW()) WHERE id=?')->execute($vals);}
      else {$pdo->prepare('INSERT INTO blogs(title,slug,excerpt,body,image_url,category,favicon,keywords,seo_title,meta_description,og_title,og_description,og_image,status,published_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())')->execute($vals);}
    } elseif($type==='events') {
      $vals=[$title,$slug,$excerpt,$body,$url,trim($_POST['category']??''),trim($_POST['favicon']??''),trim($_POST['keywords']??''),trim($_POST['seo_title']??''),trim($_POST['meta_description']??''),trim($_POST['og_title']??''),trim($_POST['og_description']??''),trim($_POST['og_image']??''),$_POST['event_date']??'',trim($_POST['location']??''),$status];
      if($id){$vals[]=$id;$pdo->prepare('UPDATE events SET title=?,slug=?,excerpt=?,body=?,image_url=?,category=?,favicon=?,keywords=?,seo_title=?,meta_description=?,og_title=?,og_description=?,og_image=?,event_date=?,location=?,status=? WHERE id=?')->execute($vals);}
      else {$pdo->prepare('INSERT INTO events(title,slug,excerpt,body,image_url,category,favicon,keywords,seo_title,meta_description,og_title,og_description,og_image,event_date,location,status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)')->execute($vals);}
    } else {
      $vals=[$title,$slug,$excerpt,$body,$url,trim($_POST['icon']??'fa-solid fa-boxes-stacked'),(int)($_POST['sort_order']??0),$status];
      if($id){$vals[]=$id;$pdo->prepare('UPDATE services SET title=?,slug=?,excerpt=?,body=?,image_url=?,icon=?,sort_order=?,status=? WHERE id=?')->execute($vals);}
      else {$pdo->prepare('INSERT INTO services(title,slug,excerpt,body,image_url,icon,sort_order,status) VALUES(?,?,?,?,?,?,?,?)')->execute($vals);}
    }
  }
  json_response(true,'Content saved successfully.');
} catch(Throwable $e){ json_response(false,'Could not save content: '.$e->getMessage(),[],422); }
