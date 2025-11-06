#!/bin/bash

# WordPress Development Environment Start Script

echo "🚀 Starting DealRoom WordPress Development Environment..."
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Start Docker Compose
docker-compose up -d

# Wait for services to be ready
echo ""
echo "⏳ Waiting for services to start..."
sleep 5

# Check if services are running
if [ "$(docker-compose ps -q | wc -l)" -eq 3 ]; then
    echo ""
    echo "✅ All services are running!"
    echo ""
    echo "📍 Access your WordPress site:"
    echo "   WordPress:   http://localhost:8080"
    echo "   phpMyAdmin:  http://localhost:8081"
    echo ""
    echo "🔑 Database credentials:"
    echo "   User:     wordpress"
    echo "   Password: wordpress"
    echo "   Database: wordpress"
    echo ""
    echo "📚 For more information, see README.md"
    echo ""
else
    echo ""
    echo "⚠️  Some services may not have started properly."
    echo "   Run 'docker-compose logs' to see what went wrong."
fi
