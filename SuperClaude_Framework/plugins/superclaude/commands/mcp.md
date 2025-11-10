name: mcp
description: List and manage MCP servers
category: system
personas: []
---

# MCP Server Management

## Available MCP Servers

### Active MCP Servers
- **magic** - UI components (21st.dev) - ✅ Connected

### Configured MCP Servers
1. **context7** - Official documentation and research
2. **playwright** - Browser automation
3. **tavily** - Web search
4. **morphllm-fast-apply** - Fast model application
5. **chrome-devtools** - Chrome developer tools
6. **memory** - Memory system
7. **serena** - Session persistence
8. **mindbase** - Cross-session learning
9. **sequential** - Token-efficient reasoning
10. **magic** - UI components (21st.dev)

## MCP Commands

### Check MCP Status
```bash
claude mcp list
```

### MCP Configuration Files
- `/home/arturdr/.claude/mcp/superclaude-mcp.json` - Active configuration
- `/home/arturdr/.claude/mcp/superclaude-servers.json` - Server definitions

## Usage Notes

- MCP servers provide specialized tools and capabilities
- Some servers require API keys configured in environment variables
- Use `claude mcp list` to check current server status
- Configuration files define server commands and environment variables

## High Priority MCP Servers

**Essential for development:**
- **Tavily**: Web search (Deep Research)
- **Context7**: Official documentation (prevent hallucination)
- **Sequential**: Token-efficient reasoning (30-50% reduction)
- **Serena**: Session persistence
- **Mindbase**: Cross-session learning

**Optional:**
- Playwright (browser automation)
- Magic (UI components)
- Chrome DevTools (performance)