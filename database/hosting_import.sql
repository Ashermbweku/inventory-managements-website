
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(30) DEFAULT 'approved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_comment_blog` (`blog_id`),
  KEY `idx_comment_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
DROP TABLE IF EXISTS `blog_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `visitor_token` varchar(100) NOT NULL,
  `reaction` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_reaction_blog` (`blog_id`),
  KEY `idx_reaction_token` (`visitor_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `blog_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_reactions` ENABLE KEYS */;
DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(220) NOT NULL,
  `slug` varchar(220) NOT NULL,
  `category` varchar(120) DEFAULT NULL,
  `favicon` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `seo_title` varchar(220) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `og_title` varchar(220) DEFAULT NULL,
  `og_description` varchar(320) DEFAULT NULL,
  `og_image` varchar(500) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'draft',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_blog_slug` (`slug`),
  KEY `idx_blog_status` (`status`),
  KEY `idx_blog_published` (`published_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'5 Signs Your Business Has Outgrown Spreadsheets','outgrown-spreadsheets',NULL,NULL,NULL,'When stock records start becoming difficult to trust, the problem is often the process rather than the people.','Growing businesses need consistent stock movement records, minimum stock thresholds, role-based workflows and reports that can be reviewed without manually rebuilding spreadsheets.','assets/img/site/blog-1.jpg',NULL,NULL,NULL,NULL,NULL,'published','2026-10-18 21:07:32','2026-10-18 19:07:32','2026-10-18 23:44:21'),(2,'How Low-Stock Alerts Protect Daily Sales','low-stock-alerts',NULL,NULL,NULL,'A reorder level gives your team time to act before the shelf is empty.','Low-stock alerts are most useful when every product has a minimum stock level based on lead time, sales speed and the cost of holding inventory.','assets/img/site/blog-2.jpg',NULL,NULL,NULL,NULL,NULL,'published','2026-10-14 21:07:32','2026-10-18 19:07:32','2026-10-18 23:44:21'),(3,'Stock In, Stock Out and the Audit Trail','stock-audit-trail',NULL,NULL,NULL,'Quantity alone does not explain how inventory changed.','Professional stock systems keep a movement history with the product, quantity, movement type, reason, reference, user and before/after stock values.','assets/img/site/blog-3.jpg',NULL,NULL,NULL,NULL,NULL,'published','2026-10-09 21:07:32','2026-10-18 19:07:32','2026-10-18 23:44:21'),(4,'Better Product Data Means Better Reports','better-product-data',NULL,NULL,NULL,'Consistent categories, units and SKUs make inventory reporting more useful.','Clean product master data reduces duplication and improves category summaries, stock valuation and supplier analysis.','assets/img/site/blog-4.jpg',NULL,NULL,NULL,NULL,NULL,'published','2026-10-04 21:07:32','2026-10-18 19:07:32','2026-10-18 23:44:21');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_category_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beverages','beverages','active','2026-10-18 19:07:31'),(2,'Groceries','groceries','active','2026-10-18 19:07:31'),(3,'Personal Care','personal-care','active','2026-10-18 19:07:31'),(4,'Household','household','active','2026-10-18 19:07:31'),(5,'Building Materials','building-materials','active','2026-10-18 19:07:31'),(6,'Clothing','clothing','active','2026-10-18 19:07:31');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `service` varchar(120) DEFAULT NULL,
  `message` text NOT NULL,
  `status` varchar(30) DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_contact_status` (`status`),
  KEY `idx_contact_date` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(220) NOT NULL,
  `slug` varchar(220) NOT NULL,
  `category` varchar(120) DEFAULT NULL,
  `favicon` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `seo_title` varchar(220) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `og_title` varchar(220) DEFAULT NULL,
  `og_description` varchar(320) DEFAULT NULL,
  `og_image` varchar(500) DEFAULT NULL,
  `event_date` date NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_event_slug` (`slug`),
  KEY `idx_event_date` (`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Inventory Accuracy Workshop','inventory-accuracy-workshop',NULL,NULL,NULL,'A practical session on stock counts, movement records and reorder levels.','This session demonstrates product setup, stock in/out, stock counts, low-stock monitoring and management reporting.','assets/img/site/event-1.jpg',NULL,NULL,NULL,NULL,NULL,'2026-11-01','Lusaka','published','2026-10-18 19:07:32','2026-10-18 23:44:21'),(2,'Small Business Digital Operations Clinic','digital-operations-clinic',NULL,NULL,NULL,'Learn how simple digital systems improve daily operations.','A hands-on clinic covering inventory, customer enquiries, reporting, website content and practical digital workflows.','assets/img/site/event-2.jpg',NULL,NULL,NULL,NULL,NULL,'2026-11-17','Online / Lusaka','published','2026-10-18 19:07:32','2026-10-18 23:44:21'),(3,'StockFlow Product Demo','stockflow-product-demo',NULL,NULL,NULL,'See the full inventory and content dashboard in action.','An overview of the public website, product catalogue, stock movements, dashboards, newsletter and content management.','assets/img/site/event-3.jpg',NULL,NULL,NULL,NULL,NULL,'2026-12-02','Online','published','2026-10-18 19:07:32','2026-10-18 23:44:21');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(180) NOT NULL,
  `caption` text DEFAULT NULL,
  `image_url` varchar(500) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` varchar(30) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_gallery_status` (`status`),
  KEY `idx_gallery_sort` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'Warehouse Control','Accurate receiving and stock movement workflows.','assets/img/site/gallery-1.jpg','Inventory',1,'published','2026-10-18 19:07:32','2026-10-18 23:44:21'),(2,'Product Organisation','Clear categories and product visibility.','assets/img/site/gallery-2.jpg','Products',2,'published','2026-10-18 19:07:32','2026-10-18 23:44:21'),(3,'Business Analytics','Use stock data to support better decisions.','assets/img/site/gallery-3.jpg','Reports',3,'published','2026-10-18 19:07:32','2026-10-18 23:44:21'),(4,'Logistics & Delivery','Reliable movement of goods from supplier to shelf.','assets/img/site/gallery-4.jpg','Operations',4,'published','2026-10-18 23:44:21','2026-10-18 23:44:21'),(5,'Team Collaboration','People and processes working with the same data.','assets/img/site/gallery-5.jpg','Team',5,'published','2026-10-18 23:44:21','2026-10-18 23:44:21'),(6,'Supplier Partnerships','Strong relationships keep stock flowing.','assets/img/site/gallery-6.jpg','Suppliers',6,'published','2026-10-18 23:44:21','2026-10-18 23:44:21');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `status` varchar(30) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_news_email` (`email`),
  KEY `idx_news_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `supplier_sku` varchar(100) DEFAULT NULL,
  `last_cost` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ps_product` (`product_id`),
  KEY `idx_ps_supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `product_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_suppliers` ENABLE KEYS */;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `sku` varchar(80) NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `unit` varchar(40) NOT NULL,
  `buying_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `minimum_stock` int(11) NOT NULL DEFAULT 5,
  `description` text DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_product_sku` (`sku`),
  KEY `idx_product_category` (`category_id`),
  KEY `idx_product_status` (`status`),
  KEY `idx_product_stock` (`quantity`,`minimum_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coca-Cola 500ml','BEV-001',1,'Bottle',0.60,1.00,80,20,'Popular chilled soft drink.','assets/img/site/product-1.jpg',1,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(2,'Coca-Cola 2L','BEV-002',1,'Bottle',1.50,2.00,35,10,'Family-size soft drink.','assets/img/site/product-2.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(3,'Sugar 2kg','GRO-001',2,'Pack',2.80,3.50,50,10,'Refined white sugar.','assets/img/site/product-3.jpg',1,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(4,'Table Salt 1kg','GRO-002',2,'Pack',0.70,1.00,45,10,'Iodised table salt.','assets/img/site/product-4.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(5,'Flour 2kg','GRO-003',2,'Pack',2.20,3.00,40,10,'All-purpose flour.','assets/img/site/product-5.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(6,'Rice 2kg','GRO-004',2,'Pack',3.20,4.00,35,10,'Long grain rice.','assets/img/site/product-6.jpg',1,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(7,'Cooking Oil 2L','GRO-005',2,'Bottle',3.80,4.50,30,8,'Vegetable cooking oil.','assets/img/site/product-7.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(8,'Sanitary Pads 10 Pack','PER-001',3,'Pack',1.20,1.80,40,10,'Everyday personal care product.','assets/img/site/product-8.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(9,'Toilet Tissue 4 Pack','HOU-001',4,'Pack',1.50,2.20,50,10,'Four-roll tissue pack.','assets/img/site/product-9.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(10,'Cement 50kg','BLD-001',5,'Bag',9.00,11.00,100,20,'General purpose cement.','assets/img/site/product-10.jpg',1,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(11,'Men\'s Jeans','CLO-001',6,'Pair',10.00,15.00,20,5,'Classic denim jeans.','assets/img/site/product-11.jpg',1,'active','2026-10-18 19:07:31','2026-10-18 23:44:21'),(12,'Men\'s Shirt','CLO-004',6,'Item',6.00,10.00,25,5,'Smart casual shirt.','assets/img/site/product-12.jpg',0,'active','2026-10-18 19:07:31','2026-10-18 23:44:21');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(100) NOT NULL,
  `supplier_id` int(10) unsigned DEFAULT NULL,
  `total` decimal(12,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
DROP TABLE IF EXISTS `sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `line_total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `sale_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_items` ENABLE KEYS */;
DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(60) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `payment_method` varchar(40) NOT NULL,
  `customer_name` varchar(160) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_no` (`receipt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(180) NOT NULL,
  `slug` varchar(180) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `icon` varchar(120) DEFAULT 'fa-solid fa-boxes-stacked',
  `sort_order` int(11) DEFAULT 0,
  `status` varchar(30) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_service_slug` (`slug`),
  KEY `idx_service_sort` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Inventory Control','inventory-control','Track stock levels, product movement and availability in real time.','Manage products, stock levels, minimum stock thresholds, categories and daily inventory operations.','assets/img/site/service-1.jpg','fa-solid fa-boxes-stacked',1,'published','2026-10-18 19:07:31'),(2,'Stock In & Out','stock-movements','Record every receipt, sale, transfer, loss or adjustment.','Every movement records quantity before and after, user, reason and reference for a useful audit trail.','assets/img/site/service-2.jpg','fa-solid fa-arrow-right-arrow-left',2,'published','2026-10-18 19:07:31'),(3,'Reports & Analytics','reports-analytics','Turn inventory records into practical business reports.','Use stock value, movement trends, category performance and low-stock reports to support purchasing decisions.','assets/img/site/service-3.jpg','fa-solid fa-chart-line',3,'published','2026-10-18 19:07:31'),(4,'Supplier Management','supplier-management','Keep supplier contacts and sourcing details organised.','Store supplier contact data and map suppliers to products without rigid database relationship constraints.','assets/img/site/service-4.jpg','fa-solid fa-truck-fast',4,'published','2026-10-18 19:07:31'),(5,'Content Management','content-management','Manage blogs, events, testimonials and featured products.','Publish public-facing content through the same secure back office used for inventory.','assets/img/site/service-5.jpg','fa-solid fa-pen-to-square',5,'published','2026-10-18 19:07:31'),(6,'Customer Enquiries','customer-enquiries','Capture website leads and newsletter subscribers in one place.','AJAX forms save enquiries and subscriptions immediately and attempt confirmation email delivery.','assets/img/site/service-6.jpg','fa-solid fa-headset',6,'published','2026-10-18 19:07:31');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'Mhofu Yemukomo Company','info@mhofuyemukomo.com','+260 977 123 456','Lusaka, Zambia','2026-10-18 19:07:31');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
DROP TABLE IF EXISTS `stock_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `expiry_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_batch_expiry` (`expiry_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `stock_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_batches` ENABLE KEYS */;
DROP TABLE IF EXISTS `stock_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock_before` int(11) NOT NULL,
  `stock_after` int(11) NOT NULL,
  `reason` varchar(180) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_tx_product` (`product_id`),
  KEY `idx_tx_date` (`created_at`),
  KEY `idx_tx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `stock_transactions` DISABLE KEYS */;
INSERT INTO `stock_transactions` VALUES (1,1,'IN',30,50,80,'New delivery','GRN-1001',NULL,'2026-10-18 19:07:32'),(2,2,'OUT',5,40,35,'Sale','SO-1002',NULL,'2026-10-18 19:07:32'),(3,3,'IN',20,30,50,'Supplier delivery','GRN-1003',NULL,'2026-10-18 19:07:32'),(4,4,'OUT',5,50,45,'Sale','SO-1004',NULL,'2026-10-18 19:07:32'),(5,5,'OUT',10,50,40,'Sale','SO-1005',NULL,'2026-10-18 19:07:32'),(6,6,'IN',15,20,35,'Supplier delivery','GRN-1006',NULL,'2026-10-18 19:07:32'),(7,7,'OUT',6,36,30,'Sale','SO-1007',NULL,'2026-10-18 19:07:32'),(8,8,'IN',20,20,40,'New stock','GRN-1008',NULL,'2026-10-18 19:07:32'),(9,9,'OUT',10,60,50,'Sale','SO-1009',NULL,'2026-10-18 19:07:32'),(10,10,'IN',50,50,100,'Supplier delivery','GRN-1010',NULL,'2026-10-18 19:07:32'),(11,11,'OUT',5,25,20,'Sale','SO-1011',NULL,'2026-10-18 19:07:32'),(12,12,'IN',10,15,25,'New stock','GRN-1012',NULL,'2026-10-18 19:07:32');
/*!40000 ALTER TABLE `stock_transactions` ENABLE KEYS */;
DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `contact_person` varchar(120) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_supplier_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `role` varchar(160) DEFAULT NULL,
  `quote` text NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_testimonial_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Tawanda M.','Retail Manager','The dashboard makes it much easier to see which products need attention before we run out.','assets/img/site/avatar-1.jpg','published','2026-10-18 19:07:32'),(2,'Ruth K.','Operations Lead','The stock movement history gives us a clearer audit trail than our old spreadsheet process.','assets/img/site/avatar-2.jpg','published','2026-10-18 19:07:32'),(3,'Daniel P.','Business Owner','The interface is clean enough for daily use while still giving us useful reports and content tools.','assets/img/site/avatar-3.jpg','published','2026-10-18 19:07:32');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'editor',
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'System Administrator','admin@mhofuyemukomo.local','$2y$12$XkLskurFIK4v9oOlNaY9w.lS0AkKdVc3HD9Hd5Kgq6WnOpJx7WR0G','admin','active','2026-10-18 19:07:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
DROP TABLE IF EXISTS `v_dashboard_stats`;
/*!50001 DROP VIEW IF EXISTS `v_dashboard_stats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dashboard_stats` AS SELECT
 1 AS `total_products`,
  1 AS `stock_units`,
  1 AS `stock_value`,
  1 AS `retail_value`,
  1 AS `low_stock`,
  1 AS `out_of_stock`,
  1 AS `subscribers`,
  1 AS `enquiries`,
  1 AS `published_blogs`,
  1 AS `upcoming_events` */;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `v_low_stock`;
/*!50001 DROP VIEW IF EXISTS `v_low_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_low_stock` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `sku`,
  1 AS `quantity`,
  1 AS `minimum_stock`,
  1 AS `unit`,
  1 AS `category` */;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `v_stock_history`;
/*!50001 DROP VIEW IF EXISTS `v_stock_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_stock_history` AS SELECT
 1 AS `id`,
  1 AS `created_at`,
  1 AS `type`,
  1 AS `quantity`,
  1 AS `stock_before`,
  1 AS `stock_after`,
  1 AS `reason`,
  1 AS `reference_no`,
  1 AS `product_name`,
  1 AS `sku`,
  1 AS `user_name` */;
SET character_set_client = @saved_cs_client;
/*!50001 DROP VIEW IF EXISTS `v_dashboard_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `v_dashboard_stats` AS select (select count(0) from `products` where `products`.`status` = 'active') AS `total_products`,(select coalesce(sum(`products`.`quantity`),0) from `products` where `products`.`status` = 'active') AS `stock_units`,(select coalesce(sum(`products`.`quantity` * `products`.`buying_price`),0) from `products` where `products`.`status` = 'active') AS `stock_value`,(select coalesce(sum(`products`.`quantity` * `products`.`selling_price`),0) from `products` where `products`.`status` = 'active') AS `retail_value`,(select count(0) from `products` where `products`.`status` = 'active' and `products`.`quantity` <= `products`.`minimum_stock`) AS `low_stock`,(select count(0) from `products` where `products`.`status` = 'active' and `products`.`quantity` <= 0) AS `out_of_stock`,(select count(0) from `newsletter_subscribers` where `newsletter_subscribers`.`status` = 'active') AS `subscribers`,(select count(0) from `contacts`) AS `enquiries`,(select count(0) from `blogs` where `blogs`.`status` = 'published') AS `published_blogs`,(select count(0) from `events` where `events`.`status` = 'published' and `events`.`event_date` >= curdate()) AS `upcoming_events` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `v_low_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `v_low_stock` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`sku` AS `sku`,`p`.`quantity` AS `quantity`,`p`.`minimum_stock` AS `minimum_stock`,`p`.`unit` AS `unit`,`c`.`name` AS `category` from (`products` `p` left join `categories` `c` on(`c`.`id` = `p`.`category_id`)) where `p`.`status` = 'active' and `p`.`quantity` <= `p`.`minimum_stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `v_stock_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_history` AS select `t`.`id` AS `id`,`t`.`created_at` AS `created_at`,`t`.`type` AS `type`,`t`.`quantity` AS `quantity`,`t`.`stock_before` AS `stock_before`,`t`.`stock_after` AS `stock_after`,`t`.`reason` AS `reason`,`t`.`reference_no` AS `reference_no`,`p`.`name` AS `product_name`,`p`.`sku` AS `sku`,`u`.`name` AS `user_name` from ((`stock_transactions` `t` left join `products` `p` on(`p`.`id` = `t`.`product_id`)) left join `users` `u` on(`u`.`id` = `t`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

