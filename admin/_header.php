<?php
require_once dirname(__DIR__).'/config/db.php';
require_once dirname(__DIR__).'/includes/functions.php';
require_once dirname(__DIR__).'/includes/auth.php';
require_admin();
$current = basename($_SERVER['PHP_SELF'] ?? 'index.php');
?>
<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="theme-color" content="#07539b"><title><?=e($admin_title??'Dashboard')?> | Mhofu Inventory</title><link rel="icon" href="../assets/img/favicon.png"><link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css"><link rel="stylesheet" href="assets/admin.css"></head><body><div class="admin-layout">
<aside class="admin-sidebar"><a class="admin-logo" href="index.php" title="Mhofu Inventory Dashboard"><img src="../assets/img/mhofu-admin-icon.png" alt="Mhofu logo"><span><b>Mhofu</b><small>Inventory Manager</small></span></a><nav class="admin-nav" aria-label="Main navigation">
<a class="<?=$current==='index.php'?'active':''?>" href="index.php"><i class="fa-solid fa-chart-pie"></i> Dashboard</a>
<a class="<?=$current==='products.php'?'active':''?>" href="products.php"><i class="fa-solid fa-boxes-stacked"></i> Products</a>
<a class="<?=$current==='stock.php'?'active':''?>" href="stock.php"><i class="fa-solid fa-arrow-right-arrow-left"></i> Stock In / Out</a>
<a class="<?=$current==='suppliers.php'?'active':''?>" href="suppliers.php"><i class="fa-solid fa-truck-field"></i> Suppliers</a>
<a class="<?=$current==='purchases.php'?'active':''?>" href="purchases.php"><i class="fa-solid fa-cart-flatbed"></i> Purchases</a>
<a class="<?=$current==='sales.php'?'active':''?>" href="sales.php"><i class="fa-solid fa-cash-register"></i> Sales & Receipts</a>
<a class="<?=$current==='adjustments.php'?'active':''?>" href="adjustments.php"><i class="fa-solid fa-scale-balanced"></i> Stock Adjustments</a>
<a class="<?=$current==='expiry.php'?'active':''?>" href="expiry.php"><i class="fa-solid fa-calendar-xmark"></i> Batch & Expiry</a>
<a class="<?=$current==='reports.php'?'active':''?>" href="reports.php"><i class="fa-solid fa-chart-line"></i> Reports</a>
<a href="../index.php"><i class="fa-solid fa-house"></i> View Website</a>
<?php if (!admin_passwordless_enabled()): ?><a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i> Logout</a><?php endif; ?>
</nav><div class="sidebar-note"><i class="fa-solid fa-circle-check"></i><span>Inventory workspace<small>Stock, purchases and sales</small></span></div></aside>
<main class="admin-main"><header class="admin-top"><div><span class="top-eyebrow">MHOFU YEMUKOMO · INVENTORY</span><h1><?=e($admin_title??'Dashboard')?></h1><p class="top-subtitle">Manage your products and keep stock records accurate.</p></div><div class="admin-user"><div><b><?=e(admin_user()['name']??'Administrator')?></b><div class="admin-role"><?=admin_passwordless_enabled()?'Local demo access':e(admin_user()['role']??'Administrator')?></div></div><div class="avatar"><i class="fa-solid fa-user"></i></div></div></header>
<?php if (admin_passwordless_enabled()): ?><div class="demo-warning"><i class="fa-solid fa-triangle-exclamation"></i><span><b>Local demo mode:</b> passwordless administrator access is enabled. Do not publish this configuration to the internet.</span></div><?php endif; ?>
