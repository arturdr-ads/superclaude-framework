#!/bin/bash

# Script de instalação do airis-mcp-gateway para SuperClaude Framework
# https://github.com/agiletec-inc/airis-mcp-gateway

set -e

echo "🚀 Instalando airis-mcp-gateway para SuperClaude Framework..."

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não encontrado. Instale Docker primeiro."
    echo "   Instruções: https://docs.docker.com/get-docker/"
    exit 1
fi

# Verificar se Docker Compose está disponível
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "❌ Docker Compose não encontrado. Instale Docker Compose primeiro."
    exit 1
fi

# Verificar versões
echo "✅ Docker: $(docker --version)"
if command -v docker-compose &> /dev/null; then
    echo "✅ Docker Compose: $(docker-compose --version)"
else
    echo "✅ Docker Compose: $(docker compose version)"
fi

# Clonar repositório
echo "📦 Clonando repositório airis-mcp-gateway..."
cd /tmp
if [ -d "airis-mcp-gateway" ]; then
    echo "⚠️  Diretório já existe, atualizando..."
    cd airis-mcp-gateway
    git pull origin main
else
    git clone https://github.com/agiletec-inc/airis-mcp-gateway.git
    cd airis-mcp-gateway
fi

# Instalar usando Makefile
echo "⚙️  Executando instalação via Makefile..."
make init

echo "✅ airis-mcp-gateway instalado com sucesso!"
echo "   Localização: /tmp/airis-mcp-gateway"

# Configurar perfil recomendado (inclui Mindbase)
echo "⚙️  Configurando perfil 'recommended' (inclui Mindbase)..."

# Criar diretório de configuração se não existir
mkdir -p ~/.claude/mcp

# Configurar servidores MCP com airis-mcp-gateway
cat > ~/.claude/mcp/airis-gateway-config.json << 'EOF'
{
  "profiles": {
    "recommended": {
      "description": "Perfil recomendado para SuperClaude - inclui Mindbase para aprendizado entre sessões",
      "servers": [
        "tavily",
        "serena",
        "mindbase",
        "sequential",
        "context7",
        "playwright",
        "magic",
        "chrome-devtools"
      ]
    },
    "minimal": {
      "description": "Perfil minimal para tarefas rápidas",
      "servers": [
        "tavily",
        "context7"
      ]
    }
  },
  "default_profile": "recommended"
}
EOF

echo "✅ Configuração do airis-mcp-gateway concluída!"
echo ""
echo "📋 Próximos passos:"
echo "   1. Configure as chaves API no arquivo ~/.claude/mcp/SETUP_INSTRUCTIONS.md"
echo "   2. Reinicie o Claude Code para carregar os servidores MCP"
echo "   3. Teste com: claude mcp list"
echo ""
echo "🔧 Para usar o airis-mcp-gateway:"
echo "   airis-mcp-gateway --profile recommended"
echo ""
echo "🎯 O Mindbase estará disponível automaticamente para aprendizado entre sessões!"