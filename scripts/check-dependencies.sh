#!/bin/bash
# Script para validar dependencias Maven contra vulnerabilidades

set -e

echo "🔍 Analizando dependencias con OWASP Dependency-Check..."
echo ""

# Ejecutar OWASP Dependency-Check
mvn verify org.owasp:dependency-check-maven:check -DfailBuildOnCVSS=7.0

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ No se encontraron vulnerabilidades críticas en las dependencias"
else
    echo ""
    echo "❌ Se encontraron vulnerabilidades en las dependencias"
    echo "   Consulta el reporte en: target/dependency-check-report.html"
    exit 1
fi
