#!/usr/bin/env bash
# Script de PRACTICE - Para practicar antes de grabar el video
# Uso: bash PRACTICE_VIDEO.sh

set -e

echo "🎬 SCRIPT DE PRÁCTICA: Doble Validación de Seguridad"
echo "═════════════════════════════════════════════════════════"
echo ""
echo "Este script te ayuda a practicar cada paso del video."
echo "¡NO grabará, solo practicará!"
echo ""
echo "Presiona ENTER para continuar..."
read

# Verificar que estamos en el proyecto correcto
if [ ! -f ".git/hooks/pre-commit" ]; then
    echo "❌ Error: No estamos en el la carpeta del proyecto."
    echo "Navega a: c:\Users\JUAN\Documents\GitHub\Seguridad-en-Entornos-locales"
    exit 1
fi

# ═══════════════════════════════════════════════════════════════════

echo ""
echo "🎯 PASO 1: Ver el estado actual"
echo "════════════════════════════════"
echo ""
echo "Ejecutando: git status"
git status
echo ""
echo "Presiona ENTER para continuar..."
read

# ═══════════════════════════════════════════════════════════════════

echo ""
echo "🎯 PASO 2: Ver el código"
echo "═════════════════════════"
echo ""
echo "Este es el SecurityCheckController:"
echo ""
head -30 src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java
echo ""
echo "Presiona ENTER para continuar..."
read

# ═══════════════════════════════════════════════════════════════════

echo ""
echo "🎯 PASO 3: SIMULAR commit fallido"
echo "═════════════════════════════════"
echo ""
echo "Vamos a intentar hacer commit (será bloqueado):"
echo ""
echo "Comando: git add src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java"
git add src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java

echo ""
echo "Comando: git commit -m 'PRACTICE: Testing pre-commit hook'"
echo ""
echo "Resultado esperado: BLOQUEADO ❌"
echo ""

if git commit -m "PRACTICE: Testing pre-commit hook" 2>&1; then
    echo "⚠️  Commit fue PERMITIDO (inesperado)"
else
    echo "✅ Commit fue BLOQUEADO (como esperado)"
    echo "   El pre-commit hook está funcionando correctamente"
fi

echo ""
echo "Presiona ENTER para continuar..."
read

# ═══════════════════════════════════════════════════════════════════

echo ""
echo "🎯 PASO 4: Resetear"
echo "═════════════════"
echo ""
echo "Comando: git reset --hard HEAD"
git reset --hard HEAD

echo ""
echo "✅ Estado reseteado"
echo ""
echo "Presiona ENTER para final..."
read

# ═══════════════════════════════════════════════════════════════════

echo ""
echo "✅ PRÁCTICA COMPLETADA"
echo "════════════════════════"
echo ""
echo "📝 Resumen de lo que vimos:"
echo "   1. El código tiene secretos hardcodeados"
echo "   2. El pre-commit hook los detectó"
echo "   3. El commit fue BLOQUEADO"
echo "   4. Reseteamos para volver al estado inicial"
echo ""
echo "🎬 Próximo paso: Grabar el VIDEO"
echo ""
echo "Comandos para grabar:"
echo "  1. Ver COMANDOS_PARA_GRABAR.md o COPY_PASTE_COMANDOS.txt"
echo "  2. Sigue los pasos en orden"
echo "  3. ¡No olvides narrar cada paso!"
echo ""
