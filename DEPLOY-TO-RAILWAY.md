# Deploy to Railway.app - Step-by-Step Guide

This is the **easiest** way to get your WordPress site running without Docker on your local machine.

## What is Railway?
Railway is a cloud platform that can run your Docker Compose configuration automatically. You just connect your GitHub repo and it deploys everything!

---

## Step-by-Step Instructions

### Step 1: Sign Up for Railway

1. Go to **https://railway.app/**
2. Click **"Login"**
3. Sign in with **GitHub** (easiest option)
4. Authorize Railway to access your GitHub

### Step 2: Create a New Project

1. Click **"New Project"** button
2. Select **"Deploy from GitHub repo"**
3. You might need to **configure GitHub App** first:
   - Click "Configure GitHub App"
   - Select which repos Railway can access
   - Choose "All repositories" or select `dealroomv2` specifically
   - Click Save

### Step 3: Deploy Your Repository

1. Back in Railway, click **"Deploy from GitHub repo"** again
2. Find and select: **`stevenovak55/dealroomv2`**
3. Railway will show you: "We found a docker-compose.yml"
4. Click **"Deploy"**

### Step 4: Configure Services

Railway will create 3 services from your docker-compose.yml:
- `wordpress`
- `db` (MySQL)
- `phpmyadmin`

#### Configure WordPress:
1. Click on the **`wordpress`** service
2. Go to **Settings** tab
3. Under **Networking**, click **"Generate Domain"**
4. Railway will give you a URL like: `yoursite-production.up.railway.app`
5. **Copy this URL** - this is your WordPress site!

#### Configure phpMyAdmin (optional):
1. Click on the **`phpmyadmin`** service
2. Go to **Settings** tab
3. Under **Networking**, click **"Generate Domain"**
4. This gives you a URL for database management

### Step 5: Access Your WordPress Site

1. Open the WordPress URL from Step 4 in your browser
2. You should see the **WordPress Installation** page
3. If you see "Error establishing database connection":
   - Wait 2-3 minutes for MySQL to fully start
   - Refresh the page

### Step 6: Complete WordPress Setup

1. Select your **language**
2. Fill in:
   - **Site Title**: DealRoom (or your choice)
   - **Username**: admin (or your choice - remember this!)
   - **Password**: Create a strong password
   - **Email**: Your email address
3. Click **"Install WordPress"**
4. Click **"Log In"**

### Step 7: Install Your Plugin

Now you can install your plugin:

#### Option A: Upload via WordPress Admin (Easiest)
1. Go to your WordPress admin: `https://your-railway-url/wp-admin`
2. Login with credentials from Step 6
3. Go to **Plugins** → **Add New** → **Upload Plugin**
4. Upload your plugin ZIP file
5. Click **"Install Now"** → **"Activate"**

#### Option B: Add to Git Repository (For Development)
1. Put your plugin in `wp-content/plugins/your-plugin-name/`
2. Commit and push to GitHub:
   ```bash
   git add wp-content/plugins/
   git commit -m "Add custom plugin"
   git push
   ```
3. Railway will automatically redeploy
4. Activate the plugin in WordPress admin

---

## Important Notes

### Database Persistence
- Your database is stored in a Railway volume
- It persists across deployments
- **Don't use `docker-compose down -v`** on Railway (they manage volumes)

### Costs
- **Free Tier**: $5/month credit
- Your setup will likely use: ~$2-3/month
- If you exceed free tier, you'll need to add a payment method

### Environment Variables
If you need to customize, go to your service → **Variables** tab:
- `WORDPRESS_DB_HOST=db:3306`
- `WORDPRESS_DB_NAME=wordpress`
- `WORDPRESS_DB_USER=wordpress`
- `WORDPRESS_DB_PASSWORD=wordpress`

### Automatic Deployments
- Every time you push to GitHub, Railway redeploys automatically
- Check deployment status in the Railway dashboard
- View logs to debug any issues

---

## Accessing Your Site

After deployment, you'll have:
- **WordPress Site**: `https://your-site-production.up.railway.app`
- **WordPress Admin**: `https://your-site-production.up.railway.app/wp-admin`
- **phpMyAdmin**: `https://your-phpmyadmin-production.up.railway.app`

---

## Troubleshooting

### "Error establishing database connection"
**Solution**: Wait 2-3 minutes for MySQL to fully start, then refresh

### Service won't start
1. Click on the service
2. Check the **"Deployments"** tab
3. Click on the latest deployment
4. Check **logs** for errors

### Need to restart services
1. Go to the service in Railway
2. Click **Settings**
3. Scroll down and click **"Restart"**

### Database not persisting
1. Check that the `db` service has a volume attached
2. In Railway: Service → Data → Volumes

---

## Development Workflow

Once set up on Railway, your workflow is:

1. **Develop plugin locally** in `wp-content/plugins/your-plugin/`
2. **Test locally** (if you have LocalWP) or **test directly on Railway**
3. **Commit changes**: `git add . && git commit -m "Update plugin"`
4. **Push**: `git push`
5. **Railway auto-deploys** (takes 1-2 minutes)
6. **Test on your Railway URL**

---

## Next Steps

After successful deployment:

1. ✅ Save your WordPress admin credentials
2. ✅ Save your Railway URL
3. ✅ Install your custom plugin
4. ✅ Start developing!
5. ⚠️ Consider upgrading to a paid plan for production use
6. ⚠️ Set up proper backups for production data

---

## Alternative if Railway Doesn't Work

If Railway gives you issues, try:
- **InstaWP** (instant WordPress sandbox): https://instawp.com/
- **LocalWP** (desktop app): https://localwp.com/
- See `QUICK-START-ALTERNATIVES.md` for more options

---

## Getting Help

- **Railway Docs**: https://docs.railway.app/
- **Railway Discord**: https://discord.gg/railway
- **This Project Issues**: Create an issue in the GitHub repo

---

Happy developing! 🚀
