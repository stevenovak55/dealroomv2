# DealRoom WordPress Development Environment

A Docker-based WordPress development environment for developing and testing custom WordPress plugins and themes.

## 🚀 Don't Have Docker? No Problem!

If you can't run Docker locally or are using Claude Code web, see these quick alternatives:

- **⚡ [Deploy to Railway.app](DEPLOY-TO-RAILWAY.md)** - Easiest! Deploy to cloud in 5 minutes (recommended)
- **📋 [All Alternatives](QUICK-START-ALTERNATIVES.md)** - InstaWP, LocalWP, DigitalOcean, and more options

## Prerequisites (For Local Docker Setup)

- Docker installed on your machine ([Get Docker](https://docs.docker.com/get-docker/))
- Docker Compose installed (usually comes with Docker Desktop)
- Git installed

## Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd dealroomv2
```

### 2. Start the Development Environment

```bash
docker-compose up -d
```

This will start three services:
- **WordPress** - Your WordPress site
- **MySQL** - The database
- **phpMyAdmin** - Database management interface

### 3. Access Your WordPress Site

Once the containers are running, you can access:

- **WordPress Site**: http://localhost:8080
- **phpMyAdmin**: http://localhost:8081

### 4. WordPress Installation

On first access, you'll see the WordPress installation screen:

1. Select your language
2. Fill in the site information:
   - Site Title: Choose your site name
   - Username: Choose an admin username
   - Password: Choose a strong password
   - Email: Your email address
3. Click "Install WordPress"
4. Log in with your credentials

### 5. Installing Your Custom Plugin

You can install your plugin in two ways:

#### Method 1: Direct File Copy (Recommended for Development)

1. Copy your plugin folder to `wp-content/plugins/your-plugin-name/`
2. Go to WordPress Admin → Plugins
3. Find your plugin and click "Activate"

#### Method 2: Upload via WordPress Admin

1. Log in to WordPress Admin (http://localhost:8080/wp-admin)
2. Go to Plugins → Add New → Upload Plugin
3. Choose your plugin ZIP file
4. Click "Install Now" and then "Activate"

## Project Structure

```
dealroomv2/
├── docker-compose.yml          # Docker configuration
├── wp-content/
│   ├── plugins/               # Your custom plugins go here
│   ├── themes/                # Your custom themes go here
│   └── uploads/               # Media uploads (created by WordPress)
└── README.md
```

## Development Workflow

### Working with Plugins

1. Place your plugin code in `wp-content/plugins/your-plugin-name/`
2. Any changes you make will be immediately reflected in the WordPress site
3. Activate/deactivate your plugin from the WordPress admin panel

### Working with Themes

1. Place your theme code in `wp-content/themes/your-theme-name/`
2. Activate your theme from Appearance → Themes in WordPress admin

## Useful Commands

### Start the environment
```bash
docker-compose up -d
```

### Stop the environment
```bash
docker-compose down
```

### Stop and remove all data (fresh start)
```bash
docker-compose down -v
```

### View logs
```bash
docker-compose logs -f wordpress
```

### Restart WordPress
```bash
docker-compose restart wordpress
```

### Access WordPress container shell
```bash
docker exec -it dealroom_wordpress bash
```

### Access MySQL container shell
```bash
docker exec -it dealroom_mysql mysql -u wordpress -p
# Password: wordpress
```

## Database Information

- **Host**: db (or localhost:3306 from your host machine)
- **Database Name**: wordpress
- **Username**: wordpress
- **Password**: wordpress
- **Root Password**: rootpassword

## Debugging

WordPress debugging is enabled by default in this development environment:

- Debug logs are written to `/var/www/html/wp-content/debug.log` inside the container
- To view logs: `docker exec dealroom_wordpress cat /var/www/html/wp-content/debug.log`

## Ports Used

- **8080**: WordPress site
- **8081**: phpMyAdmin

If these ports are already in use on your machine, you can change them in `docker-compose.yml`:

```yaml
ports:
  - "8080:80"  # Change 8080 to another port
```

## Troubleshooting

### Port already in use
If you get an error that port 8080 or 8081 is already in use:
1. Stop the conflicting service, or
2. Change the port in `docker-compose.yml`

### Can't connect to database
1. Make sure all containers are running: `docker-compose ps`
2. Check logs: `docker-compose logs db`
3. Restart services: `docker-compose restart`

### Reset everything (fresh install)
```bash
docker-compose down -v
docker-compose up -d
```
Then access http://localhost:8080 to run the WordPress installation again.

### WordPress shows "Error establishing database connection"
This usually means the database container isn't ready yet. Wait a minute and refresh the page.

## Data Persistence

- WordPress files and database data persist across container restarts
- Your custom plugins and themes in `wp-content/` are stored on your host machine
- To completely reset: `docker-compose down -v` (removes all volumes)

## Production Deployment

This setup is for **development only**. For production:
- Use stronger passwords
- Use environment variables for sensitive data
- Configure proper security headers
- Use HTTPS with SSL certificates
- Consider managed WordPress hosting or proper production Docker setup

## Support

For issues with this development environment, please create an issue in the repository.

## License

[Your License Here]
