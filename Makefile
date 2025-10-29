
help: ##@Helper Display all commands and descriptions
	@printf "\n"
	@awk 'BEGIN {FS = ":.*##@"} \
	/^[.a-zA-Z_-]+:.*?##@/ { \
		split($$2, parts, " "); \
		section = parts[1]; \
		description = substr($$2, length(section) + 2); \
		sections[section] = sections[section] sprintf("\033[36m%-15s\033[0m %s\n", $$1, description); \
	} \
	END { \
		for (section in sections) { \
			printf "\033[1m%s\033[0m\n", section; \
			printf "%s\n", sections[section]; \
		} \
	}' $(MAKEFILE_LIST)

docker.cyphergui:
	git clone https://github.com/stefanak-michal/cyphergui.git docker.cyphergui
	cp Dockerfile.cyphergui docker.cyphergui/Dockerfile

up: ##@Docker Bring up the service
	cd docker.neo4j && make neo4j .secrets/neo4j_auth_file
	docker compose up -d

build: docker.cyphergui ##@Docker Build the service
	docker compose build

down: ##@Docker Bring all of it down
	docker compose down -v

install-mcp: ##@MCP Install Instructions
	@echo "Please run this to add the MCP to your project"
	@echo "mcp add "

inspector: ##@MCP MCP Inspector
	npx @modelcontextprotocol/inspector http://localhost:8000/sse

