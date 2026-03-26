#!/bin/bash
# Script para instalar pre-commit hooks locales
# Ejecutar: ./setup-hooks.sh

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(cd "$SCRIPT_DIR" && pwd)"
HOOKS_DIR="$PROJECT_ROOT/.git/hooks"

echo "📦 Instalando Pre-Commit Hooks..."
echo ""

# Crear directorio si no existe
mkdir -p "$HOOKS_DIR"

# Copiar scripts de hooks
echo "📝 Copiando script pre-commit..."
cp "$PROJECT_ROOT/scripts/pre-commit.sh" "$HOOKS_DIR/pre-commit"
chmod +x "$HOOKS_DIR/pre-commit"

# Copiar validador de dependencias
echo "📝 Copiando validador de dependencias..."
cp "$PROJECT_ROOT/scripts/check-dependencies.sh" "$HOOKS_DIR/pre-commit" 2>/dev/null || echo "   ⚠️  check-dependencies.sh no encontrado (opcional)"

echo ""
echo "✅ Pre-commit hooks instalados exitosamente"
echo ""
echo "🔍 Los siguientes validadores se ejecutarán ANTES de cada commit:"
echo "   • Detección de secretos expuestos"
echo "   • Verificación de archivos sensibles"
echo "   • Control de tamaño de archivos"
echo ""
echo "💡 Para saltarse los hooks (NO RECOMENDADO):"
echo "   git commit --no-verify"
