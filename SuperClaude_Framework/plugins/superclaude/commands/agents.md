name: agents
description: List and manage available agents
category: system
personas: []
---

# Available Agents

## Agent Architecture

**Three Agent Layers:**
1. **PM Agent** (`src/superclaude/pm_agent/`) - Meta-layer for knowledge management
2. **Specialist Agents** (16 agents) - Domain-specific expertise
3. **Plugin Agents** (`plugins/superclaude/agents/`) - TypeScript plugin integration

## Specialist Agents (16 Total)

### Architecture Category
- `system-architect` - Large-scale distributed systems, microservices
- `backend-architect` - Server-side systems, APIs, databases
- `frontend-architect` - Web applications, React/Vue/Angular
- `devops-architect` - Infrastructure, deployment, monitoring

### Quality & Security Category
- `security-engineer` - Application security, threat modeling
- `performance-engineer` - Optimization, scalability
- `quality-engineer` - Testing, validation
- `root-cause-analyst` - Incident analysis, debugging

### Analysis & Research Category
- `deep-research` - External knowledge gathering
- `requirements-analyst` - Requirements analysis, specification
- `repo-index` - Repository indexing, context optimization
- `learning-guide` - User guidance, documentation

### Development Category
- `python-expert` - Python-specific development
- `refactoring-expert` - Code restructuring, optimization
- `technical-writer` - Documentation, communication
- `self-review` - Code review, quality assurance

## PM Agent Core Patterns

### 1. ConfidenceChecker
- Pre-implementation assessment (≥90% required to proceed)
- 5-point validation: no duplicates, architecture compliance, official docs, OSS references, root cause identification
- ROI: 25-250x token savings by preventing wrong-direction work

### 2. SelfCheckProtocol
- Post-implementation validation with "The Four Questions"
- Hallucination detection with 7 red flags
- Evidence-based verification (tests, requirements, assumptions, evidence)

### 3. ReflexionPattern
- Error learning and prevention
- Cross-session pattern matching

## Agent Coordination

### Auto-Activation Triggers
- Keywords (e.g., "API" → backend-architect, "security" → security-engineer)
- File types (e.g., `.jsx` → frontend-architect)
- Context complexity (e.g., multi-service → system-architect)

### Coordination Partners
- Backend + Security + Performance engineers for API development
- System + DevOps architects for infrastructure planning
- Frontend + Learning guide for user interfaces

## Agent Commands

### List Available Agents
```bash
claude agents list
```

### Main Session Controller
- `/agent` - Session orchestrator with PM Agent auto-activation

## Integration Points

### Plugin System
- TypeScript agents in `plugins/superclaude/agents/`
- CLI commands (`/agent`, `/research`, `/index-repo`)
- SessionStart auto-activation hooks

### Pytest Integration
- Auto-loaded via `pyproject.toml` entry point
- Custom markers: `@pytest.mark.confidence_check`, `@pytest.mark.self_check`

## Usage Examples

### Architecture Planning
```bash
# System architecture + DevOps coordination
claude agents system-architect devops-architect
```

### API Development
```bash
# Backend + Security + Performance coordination
claude agents backend-architect security-engineer performance-engineer
```

### Code Quality
```bash
# Quality assurance + Self-review
claude agents quality-engineer self-review
```