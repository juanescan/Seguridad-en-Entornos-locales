#!/bin/bash
# Validador de que el prototipo está listo para la demo
# Uso: ./scripts/validate-demo.sh

echo "🔍 VALIDANDO ESTADO DEL PROTOTIPO"
echo "════════════════════════════════════════════════════════"
echo ""

CHECKS_PASSED=0
CHECKS_FAILED=0

# 1. Verificar estructura de carpetas
echo "1️⃣  Verificando estructura de carpetas..."
for dir in "scripts" "src/main/java/cloudSecurityLocal/ECI/controller" ".github/workflows" "src/main/resources"; do
    if [ -d "$dir" ]; then
        echo "   ✅ Carpeta existe: $dir"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        echo "   ❌ Carpeta falta: $dir"
        CHECKS_FAILED=$((CHECKS_FAILED + 1))
    fi
done

# 2. Verificar archivos importantes
echo ""
echo "2️⃣  Verificando archivos..."
for file in ".gitignore" ".env.example" "pom.xml" "Dockerfile" "docker-compose.yml" \
            ".github/workflows/security-pipeline.yml" "AZURE_SETUP.md" "VIDEO_DEMO_GUIDE.md" \
            "scripts/setup-hooks.sh" "src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java"; do
    if [ -f "$file" ]; then
        echo "   ✅ Archivo existe: $file"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        echo "   ❌ Archivo falta: $file"
        CHECKS_FAILED=$((CHECKS_FAILED + 1))
    fi
done

# 3. Verificar pre-commit hooks
echo ""
echo "3️⃣  Verificando pre-commit hooks..."
if [ -f ".git/hooks/pre-commit" ]; then
    if [ -x ".git/hooks/pre-commit" ]; then
        echo "   ✅ Pre-commit hook existe y es ejecutable"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        echo "   ⚠️  Pre-commit hook existe pero NO es ejecutable"
        echo "   Ejecutar: chmod +x .git/hooks/pre-commit"
        CHECKS_FAILED=$((CHECKS_FAILED + 1))
    fi
else
    echo "   ⚠️  Pre-commit hook no instalado"
    echo "   Ejecutar: ./scripts/setup-hooks.sh"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# 4. Verificar Maven setup
echo ""
echo "4️⃣  Verificando Maven..."
if command -v mvn &> /dev/null; then
    echo "   ✅ Maven instalado"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "   ❌ Maven NO instalado"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# 5. Verificar Java
echo ""
echo "5️⃣  Verificando Java..."
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | grep -oP '(?<=version ")[^"]+' || echo "unknown")
    echo "   ✅ Java instalado: $JAVA_VERSION"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "   ❌ Java NO instalado"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# 6. Verificar Git
echo ""
echo "6️⃣  Verificando Git..."
if command -v git &> /dev/null; then
    echo "   ✅ Git instalado"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "   ❌ Git NO instalado"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# Resumen
echo ""
echo "════════════════════════════════════════════════════════"
echo "📊 RESUMEN DE VALIDACIÓN:"
echo "════════════════════════════════════════════════════════"
echo "✅ Validaciones exitosas: $CHECKS_PASSED"
echo "❌ Validaciones fallidas:  $CHECKS_FAILED"
echo ""

if [ $CHECKS_FAILED -eq 0 ]; then
    echo "🎉 ¡TODO ESTÁ LISTO PARA LA DEMO!"
    echo ""
    echo "📝 Próximos pasos:"
    echo "   1. ./scripts/demo-1-failed-state.sh (Preparar caso fallido)"
    echo "   2. ./scripts/demo-2-fixed-state.sh (Preparar caso exitoso)"
    echo "   3. Grabar video siguiendo VIDEO_DEMO_GUIDE.md"
    exit 0
else
    echo "⚠️  Faltan réplicas antes de grabar. Por favor, arregatlas."
    exit 1
fi
