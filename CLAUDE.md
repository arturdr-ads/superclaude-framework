# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **SuperClaude Framework** - a meta-programming configuration framework that transforms Claude Code into a structured development platform through behavioral instruction injection and component orchestration.

## 🐍 Python Environment Rules

**CRITICAL**: This project uses **UV** for all Python operations. Never use `python -m`, `pip install`, or `python script.py` directly.

### Required Commands

```bash
# All Python operations must use UV
uv run pytest                    # Run tests
uv pip install package           # Install dependencies
uv run python script.py          # Execute scripts
```

## 📂 Project Structure

**Dual-language architecture**: TypeScript plugins for Claude Code integration + Python package for CLI tools.

```
SuperClaude_Framework/
├── src/superclaude/            # Python package (CLI tools & pytest integration)
│   ├── pytest_plugin.py       # Auto-loaded pytest integration
│   ├── pm_agent/              # Confidence, self_check, reflexion patterns
│   ├── execution/             # Parallel execution, reflection, self_correction
│   └── cli/                   # CLI commands (main.py, doctor.py)
├── plugins/superclaude/        # TypeScript plugins (source)
│   ├── agents/                # Specialized AI agents
│   ├── commands/              # Plugin command definitions
│   ├── hooks/                 # SessionStart auto-activation
│   ├── scripts/               # Build and utility scripts
│   └── skills/                # Confidence-check skill
├── docs/                      # Documentation
├── scripts/                   # Analysis tools (workflow metrics, A/B testing)
└── mem0/                      # Memory system integration
```

## 🔧 Development Workflow

### Essential Commands

```bash
# Setup
make install                   # Install in editable mode with dev dependencies
make verify                    # Verify installation (package, plugin, health)

# Testing
make test                      # Run full test suite
make test-plugin               # Test pytest plugin auto-discovery

# Code Quality
make lint                      # Run ruff linter
make format                    # Format code with ruff
make doctor                    # Health check diagnostics

# Plugin Packaging
make build-plugin              # Build plugin artefacts into dist/
make sync-plugin-repo          # Sync artefacts into ../SuperClaude_Plugin

# Maintenance
make clean                     # Remove build artifacts
```

## 📦 Core Architecture

### TypeScript Plugins (Primary Interface)

**Plugin Source**: `plugins/superclaude/` contains all plugin components
- **Agents**: 16 specialized AI agents for different domains
- **Commands**: Plugin command definitions (`/pm`, `/research`, `/index-repo`)
- **Hooks**: SessionStart auto-activation for PM Agent
- **Skills**: Confidence-check skill for pre-implementation validation

**Packaging**: `make build-plugin` generates plugin artefacts into `dist/plugins/superclaude/`

**Key Commands**:
- **/pm**: Session orchestrator with PM Agent auto-activation
- **/research**: Deep research workflow with adaptive planning
- **/index-repo**: Repository indexing with 94% token reduction

### Python Package (CLI Tools & Pytest Integration)

**Pytest Plugin**: Auto-loaded via `pyproject.toml` entry point
- **Fixtures**: `confidence_checker`, `self_check_protocol`, `reflexion_pattern`, `token_budget`
- **Custom markers**: `@pytest.mark.confidence_check`, `@pytest.mark.self_check`, `@pytest.mark.reflexion`

**CLI Tools**:
- `superclaude doctor` - Health check diagnostics
- `superclaude install-skill` - Skill installation

### PM Agent Core Patterns

**1. ConfidenceChecker** (src/superclaude/pm_agent/confidence.py)
- Pre-execution confidence assessment: ≥90% required, 70-89% present alternatives, <70% ask questions
- Prevents wrong-direction work, ROI: 25-250x token savings

**2. SelfCheckProtocol** (src/superclaude/pm_agent/self_check.py)
- Post-implementation evidence-based validation
- No speculation - verify with tests/docs

**3. ReflexionPattern** (src/superclaude/pm_agent/reflexion.py)
- Error learning and prevention
- Cross-session pattern matching

### Parallel Execution

**Wave → Checkpoint → Wave pattern** (src/superclaude/execution/parallel.py):
- 3.5x faster than sequential execution
- Automatic dependency analysis
- Example: [Read files in parallel] → Analyze → [Edit files in parallel]

## 🧪 Testing

### Current Test Status

**Note**: The test suite is currently minimal. The primary testing focus is on plugin functionality and CLI tools.

### Available Test Commands

```bash
# Test Python package
make test

# Test pytest plugin auto-discovery
make test-plugin

# Run health check diagnostics
make doctor
```

## 🌿 Git Workflow

**Branch structure**: `master` (production) with feature branches

**Standard workflow**:
1. Create feature branch: `git checkout -b feature/your-feature`
2. Develop with tests: `make test`
3. Commit: `git commit -m "feat: description"` (conventional commits)
4. Create pull request to `master`

### Parallel Development with Git Worktrees

**CRITICAL**: When running multiple Claude Code sessions in parallel, use `git worktree` to avoid conflicts.

```bash
# Create worktree for feature branch
cd ~/Claude/SuperClaude_Framework
git worktree add ../SuperClaude_Framework-feature feature/your-feature
```

**Benefits**:
- Run Claude Code sessions on different branches simultaneously
- No branch switching conflicts
- Independent working directories
- Parallel development without state corruption

**Usage**:
- Session A: Open `~/Claude/SuperClaude_Framework/` (current branch)
- Session B: Open `~/Claude/SuperClaude_Framework-feature/` (feature branch)

## 📝 Key Documentation Files

**README.md** - Project overview, installation, and usage
**AGENTS.md** - Agent definitions and capabilities
**PROJECT_INDEX.md** - Repository index for context optimization
**CONTRIBUTING.md** - Contribution guidelines
**CLAUDE.md** - This file - development guidance for Claude Code

Additional docs in `docs/` directory

## 💡 Core Development Principles

### 1. Evidence-Based Development
**Never guess** - verify with official docs (WebFetch, WebSearch) before implementation.

### 2. Confidence-First Implementation
Check confidence BEFORE starting: ≥90% proceed, 70-89% present alternatives, <70% ask questions.

### 3. Parallel-First Execution
Use **Wave → Checkpoint → Wave** pattern (3.5x faster). Example: `[Read files in parallel]` → Analyze → `[Edit files in parallel]`

### 4. Token Efficiency
- Simple (typo): 200 tokens
- Medium (bug fix): 1,000 tokens
- Complex (feature): 2,500 tokens
- Confidence check ROI: spend 100-200 to save 5,000-50,000

## 🚀 Plugin Development

### Plugin Architecture

**Source Structure**: `plugins/superclaude/` contains all plugin components
- **Agents**: Specialized AI agents (`agents/`)
- **Commands**: Plugin command definitions (`commands/`)
- **Hooks**: SessionStart auto-activation (`hooks/`)
- **Skills**: Confidence-check skill (`skills/`)
- **Scripts**: Build utilities (`scripts/`)

### Development Workflow

```bash
# 1. Edit plugin source
vim plugins/superclaude/commands/pm.md
vim plugins/superclaude/skills/confidence-check/confidence.ts

# 2. Build plugin artefacts
make build-plugin

# 3. (optional) Sync to distribution repository
make sync-plugin-repo
```

### Plugin Packaging

**Build Process**: `make build-plugin` generates plugin artefacts into `dist/plugins/superclaude/`

**Distribution**: `make sync-plugin-repo` syncs artefacts to `../SuperClaude_Plugin` for marketplace distribution

## 📊 Package Information

**Package name**: `superclaude`
**Version**: 0.4.0
**Python**: >=3.10
**Build system**: hatchling (PEP 517)

**Entry points**:
- CLI: `superclaude` command
- Pytest plugin: Auto-loaded as `superclaude`

**Dependencies**:
- pytest>=7.0.0
- click>=8.0.0
- rich>=13.0.0