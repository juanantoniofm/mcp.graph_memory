
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


neo4j: # Init step
	mkdir -p neo4j

.secrets/neo4j_auth_file: # neo4j secret
	mkdir -p .secrets
	echo "neo4j/your_password" > .secrets/neo4j_auth_file

up: neo4j .secrets/neo4j_auth_file ##@Command Bring up neo4j
	docker compose up -d

