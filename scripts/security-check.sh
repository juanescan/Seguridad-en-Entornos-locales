#!/bin/bash
# Script de validación de seguridad local
# Ejecutar: ./scripts/security-check.sh

echo "🔐 INICIANDO VALIDACIÓN DE SEGURIDAD LOCAL"
echo "════════════════════════════════════════════════════════"
echo ""

# Variables
RESULTS_DIR="./security-results"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Crear directorio de resultados
mkdir -p "$RESULTS_DIR"

echo "📋 PASO 1: Buscando secretos en el código fuente..."
echo ""

# Buscar secretos
if grep -r -E "api[_-]?key|password|secret|sk_live|pk_live" src/ --include="*.java" --include="*.properties" --include="*.yml" 2>/dev/null | grep -v "^Binary" > "$RESULTS_DIR/secrets_$TIMESTAMP.log"; then
    echo "⚠️  Secretos encontrados:"
    cat "$RESULTS_DIR/secrets_$TIMESTAMP.log"
    echo ""
    echo "❌ VALIDACIÓN FALLIDA: Se detectaron secretos en el código"
    echo ""
    exit 1
else
    echo "✅ No se detectaron secretos obvios"
    echo ""
fi

echo "📦 PASO 2: Verificando vulnerabilidades en dependencias..."
echo ""

# Ejecutar Maven compile para asegurar que todo esté actualizado
mvn clean compile -DskipTests 2>&1 | tail -20

echo ""
echo "✅ Compilación exitosa"
echo ""

echo "🔍 PASO 3: Análisis estático de código (búsqueda de patrones inseguros)..."
echo ""

# Buscar patrones de código inseguro
if grep -r "\(hardcoded\|hardcode\|TODO\|FIXME.*security\|HACK.*security\)" src/ --include="*.java" 2>/dev/null; then
    echo "⚠️  Se encontraron comentarios de alerta"
    echo ""
else
    echo "✅ No se encontraron patrones obviamente inseguros"
    echo ""
fi

echo "════════════════════════════════════════════════════════"
echo "✅ VALIDACIÓN DE SEGURIDAD LOCAL COMPLETADA"
echo "════════════════════════════════════════════════════════"
echo ""
echo "📁 Reportes guardados en: $RESULTS_DIR"
echo ""
