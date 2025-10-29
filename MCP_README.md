# Neo4j Memory MCP

Neo4j Graph Memory MCP Server.

<https://github.com/neo4j-contrib/mcp-neo4j/tree/main/servers/mcp-neo4j-memory>

## Adding the MCP

Add this to wherever you put your MCPs.

```json
"mcpServers": {
  "neo4j": {
    "command": "docker",
    "args": [
      "run",
      "--rm",
      "-e", "NEO4J_URL=neo4j+s://localhost:7687",
      "-e", "NEO4J_USERNAME=neo4j",
      "-e", "NEO4J_PASSWORD=your_password",
      "mcp/neo4j-memory:0.4.1"
    ]
  }
}
```

or

```bash
claude mcp add --transport stdio neo4j -- docker run --rm -e NEO4J_URL="neo4j+s://localhost:7687" -e NEO4J_USERNAME="neo4j" -e NEO4J_PASSWORD="your_password" mcp/neo4j-memory:0.4.1
```
