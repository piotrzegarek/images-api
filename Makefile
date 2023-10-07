.PHONY: init run migration migrate lint help


init:
	@echo "${GREEN}Installing dependencies...${NC}"
	@poetry install
	@pre-commit install
	@chmod +x run_server.sh
	@echo "${GREEN}Dependencies installed successfully.${NC}"

run:
	@echo "${GREEN}Starting development server...${NC}"
	@./run_server.sh

migration:
	@echo "${GREEN}Creating migrations...${NC}"
	@python manage.py makemigrations
	@echo "${GREEN}Migrations created successfully.${NC}"

migrate:
	@echo "${GREEN}Applying migrations...${NC}"
	@python manage.py migrate
	@echo "${GREEN}Migrations applied successfully.${NC}"

lint:
	@echo "${GREEN}Running linters...${NC}"
	@pre-commit run --all-files

help:
	@echo "${GREEN}Django Application Makefile${NC}"
	@echo "Available commands:"
	@echo "${YELLOW}make init${NC} - Install project dependencies"
	@echo "${YELLOW}make run${NC} - Run the development server"
	@echo "${YELLOW}make migration${NC} - Create database migrations"
	@echo "${YELLOW}make migrate${NC} - Apply database migrations"
	@echo "${YELLOW}make lint${NC} - Run linters with pre-commit on all files"


# Define ANSI color codes
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m
