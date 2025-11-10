#!/bin/bash

# Script para configurar servidores MCP para SuperClaude Framework

set -e

echo "🚀 Configurando servidores MCP para SuperClaude Framework..."

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado. Instale Node.js 16+ primeiro."
    echo "   Instruções: https://nodejs.org/"
    exit 1
fi

# Verificar se npm está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ npm não encontrado. Instale npm primeiro."
    exit 1
fi

# Verificar versões
echo "✅ Node.js: $(node --version)"
echo "✅ npm: $(npm --version)"

# Instalar servidores MCP individualmente
echo "📦 Instalando servidores MCP..."

servers=(
    "@modelcontextprotocol/server-tavily"
    "@modelcontextprotocol/server-serena"
    "@modelcontextprotocol/server-mindbase"
    "@modelcontextprotocol/server-sequential"
    "@modelcontextprotocol/server-context7"
    "@modelcontextprotocol/server-playwright"
    "@modelcontextprotocol/server-magic"
    "@modelcontextprotocol/server-chrome-devtools"
)

for server in "${servers[@]}"; do
    echo "📥 Instalando $server..."
    npm install -g "$server" || echo "⚠️  Falha ao instalar $server (pode precisar de chave API)"
done

echo "✅ Servidores MCP instalados!"
echo ""
echo "📋 Próximos passos:"
echo "   1. Configure as chaves API conforme ~/.claude/mcp/SETUP_INSTRUCTIONS.md"
echo "   2. Reinicie o Claude Code"
echo "   3. Teste com: claude mcp list"
echo ""
echo "🔑 Para configurar chaves API rapidamente:"
echo "   cp scripts/mcp-api-keys-template.env .env"
echo "   # Edite .env com suas chaves API"
echo "   source .env"