#!/bin/bash

# Instalar SuperClaude Framework na pasta Claude

echo "📦 Instalando SuperClaude Framework..."

# Clonar o repositório
cd ~/Claude
git clone https://github.com/SuperClaude-Org/SuperClaude_Framework.git

# Verificar se foi clonado
if [ -d "SuperClaude_Framework" ]; then
    echo "✅ SuperClaude Framework clonado com sucesso!"

    # Verificar estrutura
    echo "📁 Estrutura criada:"
    echo "   ~/Claude/SuperClaude_Framework/"
    echo "   ~/Claude/.claude/ (configuração global)"

    # Verificar se .claude existe
    if [ -d "~/.claude" ]; then
        echo "✅ Configuração global .claude já existe"
    else
        echo "⚠️  Configuração global .claude não encontrada"
    fi
else
    echo "❌ Falha ao clonar SuperClaude Framework"
fi

echo ""
echo "🎯 Para usar o SuperClaude Framework:"
echo "   cd ~/Claude/SuperClaude_Framework"
echo "   claude"
echo ""
echo "📋 Comandos disponíveis:"
echo "   /sc:agent - Session orchestrator"
echo "   /sc:research - Deep research workflow"
echo "   /sc:index-repo - Repository indexing"
echo "   ... e mais 23 comandos!"

echo ""
echo "🚀 Instalação concluída!"