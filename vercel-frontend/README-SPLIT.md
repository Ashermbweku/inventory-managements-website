SPLIT DEPLOYMENT

1. PHP API (api-php/) - host on 000webhost/Render/Railway in htdocs or public_html. 
   - Upload api-php contents to your PHP host (so that /api/*.php is accessible)
   - Ensure DB credentials in api-php/config/db.php or api-php/.env (use same as before)

2. Frontend (vercel-frontend/) - deploy to Vercel
   - Update API_BASE in assets/js/main.js to point to your PHP API URL (e.g. https://your-php-host.com/api)
   - Deploy to Vercel (link repo or drag/drop)
   - Set environment if needed

3. Database - keep MySQL on PHP host (unchanged)

NOTES: CORS is open for quick demo; tighten later.
