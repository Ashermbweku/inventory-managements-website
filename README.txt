STOCKFLOW PRO — VERSION 2

STACK
- PHP 8+
- MySQL / MariaDB (XAMPP)
- HTML5, CSS3, JavaScript, jQuery/AJAX
- Chart.js
- Font Awesome
- Toastify toast alerts
- SweetAlert2 delete confirmations

INSTALL ON XAMPP
1. Extract folder to C:\xampp\htdocs\inventory_management_v2
2. Copy .env.example to .env and edit database/email details.
3. Start Apache and MySQL.
4. Open phpMyAdmin and import database/database.sql
5. Browse http://localhost/inventory_management_v2/
6. Go to Login > Register. The first registered account becomes admin. Later accounts become editor.

EMAIL
The code saves contacts/subscribers in the database regardless of email delivery. PHP mail() is included as a portable fallback, but local XAMPP normally needs SMTP/sendmail configuration before external emails actually arrive. Put all mail configuration in .env. For production, PHPMailer with SMTP is recommended.

IMPORTANT
- Database relationships use indexed ID columns but deliberately have NO foreign-key constraints, as requested.
- Views provide dashboard and stock-history summaries.
- Public PHP pages are in the project root, not a public/ folder.
- Uploaded images are saved under uploads/<module>/.
- External image URLs are placeholders and can be replaced from the admin forms.
- Blog likes/dislikes use a visitor cookie token to prevent normal duplicate reactions from the same browser.
- For production, add stricter rate limiting, SMTP library, HTTPS, image MIME validation, backups and a permissions matrix.


V3 additions: Mhofu Yemukomo branding, logo/favicon, extensionless public URLs, gallery CRUD, blog/event SEO fields, TinyMCE rich editor, admin blog search/edit, white admin lock icon, blue admin top bar, custom validation/toasts, data-driven gallery.
IMPORTANT: Re-import database/database.sql into a fresh database because the blog, event and gallery schema changed.


INVENTORY MODULES ADDED
- Supplier directory and inventory reports/CSV export.
- Purchases & Receiving: records supplier, reference, unit cost and received quantity; received stock updates inventory and creates an audit movement.
- Sales & Receipts: records sale, payment method and customer, generates a receipt reference and deducts stock; prevents overselling.
- Stock Adjustments: records increases/decreases with reason and keeps movement history.
- Batch & Expiry Register: records batches and highlights expired or soon-to-expire batches. Batch quantity is informational and does not itself alter total stock.

SECURITY / PRODUCTION NOTES
- Back up your database before upgrading an existing installation.
- Test in a development copy first; new module tables are created on first page visit.
- Configure strong database credentials, HTTPS, and a secure admin password before production use.
- Barcode scanning, multiple warehouses, cloud sync, automated backup/restore and fine-grained role permissions require additional device/server integration and are not represented as fully implemented by these modules.


V5 ADMIN CLEANUP AND DASHBOARD
- Simplified the admin navigation to inventory-related modules only. Website CMS links are no longer shown in the inventory sidebar.
- Refreshed dashboard cards with clear labels, explanations, Zambian Kwacha values, stock health counts, quick actions, and more readable charts/tables.
- Passwordless admin entry is available for local classroom/demo use only. The included local .env has ADMIN_PASSWORDLESS=true and APP_ENV=local, so opening /admin/index.php enters the dashboard without a password.
- IMPORTANT SECURITY WARNING: passwordless access means anyone who can reach this local server can change inventory. Do not upload this configuration to a public website. Before public hosting, set ADMIN_PASSWORDLESS=false, set APP_ENV=production, and use the secure administrator login.
- PHP syntax check completed for all 51 PHP files. Full database-backed runtime testing requires a configured MySQL/MariaDB server and was not possible in this environment. Back up your database before replacing an existing installation.
