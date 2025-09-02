.PHONY: server db postgres help deps test format phx-gen routes

# Default target - Start the Phoenix server
server:
	@echo "🚀 Starting Phoenix server..."
	mix phx.server

# Flush and recreate the development database
db:
# @echo "🐘 Starting PostgreSQL container..."
# make postgres
	@echo "🧹 Flushing development database..."
	@echo "🗑️  Dropping database..."
	mix ecto.drop
	@echo "🏗️  Creating database..."
	mix ecto.create
	@echo "📊 Running migrations..."
	mix ecto.migrate
	@echo "🌱 Seeding database..."
	mix run priv/repo/seeds.exs
	@echo "🌱 Seeding database... done"

# Start PostgreSQL container
postgres:
	@echo "🐘 Starting PostgreSQL container..."
	@if docker ps --format 'table {{.Names}}' | grep -q "my_postgres_container"; then \
		echo "✅ PostgreSQL container is already running"; \
	elif docker ps -a --format 'table {{.Names}}' | grep -q "my_postgres_container"; then \
		echo "🔄 Starting existing PostgreSQL container..."; \
		docker start my_postgres_container; \
	else \
		echo "🚀 Creating and starting new PostgreSQL container..."; \
		docker run -d -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 --name my_postgres_container postgres; \
	fi

# Install dependencies
deps:
	@echo "📦 Installing dependencies..."
	mix deps.get

# Run tests
test:
	@echo "🧪 Running tests..."
	mix test

# Format code
format:
	@echo "✨ Formatting code..."
	mix format

# Show Phoenix generator help
phx-gen:
	@echo "🏗️  Phoenix generators help:"
	mix help phx.gen

# Show all routes
routes:
	@echo "🛣️  Showing all routes..."
	mix phx.routes

# Show available commands
help:
	@echo "Available commands:"
	@echo ""
	@echo "🚀 Development:"
	@echo "  make server   - Start the Phoenix server (default)"
	@echo "  make db       - Drop, create, and migrate the database"
	@echo "  make postgres - Start PostgreSQL container"
	@echo "  make deps     - Install dependencies"
	@echo "  make test     - Run tests"
	@echo "  make format   - Format code"
	@echo "  make routes   - Show all routes"
	@echo "  make phx-gen  - Show Phoenix generator help"