.PHONY: init up down migration migrate superuser lint clean_db help


init:
	@echo "${GREEN}Installing dependencies...${NC}"
	@poetry install
	@pre-commit install
	@cp .env.sample .env
	@echo "${GREEN}Dependencies installed successfully.${NC}"

up:
	@echo "${GREEN}Starting development server...${NC}"
	@docker-compose up

down:
	@echo "${GREEN}Stopping development server...${NC}"
	@docker-compose down
	@echo "${GREEN}Development server stopped...${NC}"

migration:
	@echo "${GREEN}Creating migrations...${NC}"
	@docker-compose exec api python manage.py makemigrations
	@echo "${GREEN}Migrations created successfully.${NC}"

migrate:
	@echo "${GREEN}Applying migrations...${NC}"
	@docker-compose exec api python manage.py migrate
	@echo "${GREEN}Migrations applied successfully.${NC}"

superuser:
	@echo "${GREEN}Creating superuser...${NC}"
	@docker-compose exec api python manage.py createsuperuser --no-input
	@echo "${GREEN}Superuser created successfully.${NC}"

lint:
	@echo "${GREEN}Running linters...${NC}"
	@pre-commit run --all-files

clean_db:
	@echo "${GREEN}Cleaning database...${NC}"
	@docker-compose down -v
	@echo "${GREEN}Database cleaned successfully.${NC}"


help:
	@echo "${GREEN}Django Application Makefile${NC}"
	@echo "Available commands:"
	@echo "${YELLOW}make init${NC} - Install project dependencies"
	@echo "${YELLOW}make up${NC} - Run the development server"
	@echo "${YELLOW}make down${NC} - Stop the development server"
	@echo "${YELLOW}make migration${NC} - Create database migrations"
	@echo "${YELLOW}make migrate${NC} - Apply database migrations"
	@echo "${YELLOW}make superuser${NC} - Create superuser in database"
	@echo "${YELLOW}make lint${NC} - Run linters with pre-commit on all files"
	@echo "${YELLOW}make clean_db${NC} - Stop the development server and clean database"


# Define ANSI color codes
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m
