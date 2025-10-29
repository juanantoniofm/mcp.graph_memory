# Standalone neo4j + GUI

A simple setup of local neo4j DB + MCP + GUI.

The simplest way is to just run

```bash
make up
```

To bring up the full stack.

**Neo4j**
<http://localhost:7474>

**CypherGUI**
<http://localhost:3010>

**MCP**
<http://localhost:8010/mcp>

## Adding the MCP

Run this command to add to claude-code the HTTP version of the MCP

```bash
claude mcp add --transport http neo4j http://localhost:8010/mcp/ \
  -e NEO4J_URL="neo4j+s://host.docker.internal:7687" \
  -e NEO4J_USERNAME="neo4j" \
  -e NEO4J_PASSWORD="your_password"
```

## An easy way out

If you face issues with the above, you can use the memory-only MCP instead:

```bash
claude  mcp add memory docker run -i -v claude-memory:/app/dist --rm mcp/memory 
```
