# Deploying Mhofu Yemukomo Company (free PHP hosting)

This site is PHP + MySQL, so it needs a PHP host. **Vercel cannot host it.**

## 1. Create a free hosting account
1. Sign up at https://infinityfree.com (or 000webhost.com).
2. Create a new hosting account / website.
3. Note your **subdomain** and the **MySQL** details from the control panel:
   - MySQL host (e.g. `sqlXXX.infinityfree.com`)
   - Database name (e.g. `if0_XXXXXXXX_inventory`)
   - Username (e.g. `if0_XXXXXXXX`)
   - Password (as chosen)

## 2. Import the database
1. Open **phpMyAdmin** from the hosting panel.
2. Select your database.
3. **Import** the file `database/hosting_import.sql` from this repo.

## 3. Upload the site files
Upload everything in this repository **except** `.env`, `.git`, and `assets/New folder/`.

- Root path: upload into `htdocs/` (document root) so extensionless links like `/about` work.
- Keep the folder structure exactly (e.g. `assets/`, `includes/`, `api/`, `admin/`).

## 4. Create the environment file
1. Copy `.env.hosting.example` to `.env`.
2. Fill in your real database host/name/user/password from step 1.
3. Keep `APP_ENV=production` and **`ADMIN_PASSWORDLESS=false`**.

## 5. Permissions
Ensure the `uploads/` sub-folders are writable (usually `755`, or `775` if the host requires it).

## 6. Admin login
- URL: `https://YOUR-SUBDOMAIN/admin/`
- Email: `admin@mhofuyemukomo.com`
- Password: `Mhofu-Stock@2026`  ← change this after first login.

### Changing the admin password
Generate a new bcrypt hash and update the database:
```
php -r "echo password_hash('YourNewPassword', PASSWORD_BCRYPT, ['cost'=>12]);"
```
Then run in phpMyAdmin:
```sql
UPDATE users SET password_hash='PASTE_NEW_HASH' WHERE email='admin@mhofuyemukomo.com';
```

## Notes
- Email delivery on free hosts is limited; contact/newsletter submissions are still saved to the database.
- Download buttons serve `assets/downloads/Mhofu-Inventory-Manager.apk` and `Mhofu-Calculator.apk`.
- After deploying, update `APP_URL` in `.env` to your live URL.
