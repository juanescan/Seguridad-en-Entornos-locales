#!/bin/bash
# 🎬 GUÍA COMPLETA PARA GRABAR EL VIDEO
# Prototipo: Doble Validación de Seguridad
# Duración recomendada: 12-15 minutos

# ═══════════════════════════════════════════════════════════════════════════════
# PARTE 0: PREPARACIÓN (Antes de grabar)
# ═══════════════════════════════════════════════════════════════════════════════

echo "📋 GUÍA PARA GRABAR: Doble Validación de Seguridad"
echo ""
echo "Pasos previos:"
echo "1. Navega a la carpeta del proyecto:"

cd /c/Users/JUAN/Documents/GitHub/Seguridad-en-Entornos-locales

echo "2. Verifica que git está limpio:"
git status

echo ""
echo "3. Asegúrate de que el pre-commit hook está activo:"
ls -la .git/hooks/pre-commit

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 1: INTRODUCCIÓN (~ 1-2 minutos)
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 1: INTRODUCCIÓN"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""
echo "📝 GUIÓN:
'En este video vamos a demostrar el concepto de Doble Validación de Seguridad.
Un prototipo que tiene dos capas de protección:

1️⃣  Capa Local: Pre-commit hooks que bloquean secretos ANTES de enviar a GitHub
2️⃣  Capa Nube: GitHub Actions que ejecuta scans de seguridad adicionales

Vamos a ver:
- ❌ Primero un caso FALLIDO: intentar enviar secretos hardcodeados
- ✅ Luego el caso EXITOSO: mover secretos a variables de entorno
- 📊 GitHub Actions ejecutándose automáticamente
- ☁️ Deploy en Azure (si está configurado)
'"

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 2: DEMO 1 - CASO FALLIDO (~ 4-5 minutos)
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 2: CASO FALLIDO - SECRETOS EXPUESTOS"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""
echo "🔴 PASO 1: Ver el código vulnerable"
echo ""
echo "Comando para mostrar el archivo con secretos:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ cat src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN MIENTRAS MUESTRAS EL CÓDIGO:
'Aquí vemos el SecurityCheckController. Noten que tenemos:
- API_KEY hardcodeada: DEMO_API_KEY_EXAMPLE_12345
- DB_PASSWORD hardcodeada: DEMO_PASSWORD_EXAMPLE_67890

Esto es una VULNERABILIDAD CRÍTICA. Si alguien accede al historio de git,
puede robar estas credenciales. Vamos a intentar hacer commit...'
"

echo ""
echo "🔴 PASO 2: Resetear git al estado vulnerable"
echo ""
echo "Comando para resetear:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ git reset --hard HEAD^                                                         │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""

echo "🔴 PASO 3: Ver estado de git"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ git status                                                                    │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""

echo "🔴 PASO 4: Hacer commit (SERÁ BLOQUEADO)"
echo ""
echo "Comandos:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ git add src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java │"
echo "│ git commit -m 'DEMO-1: Add security controller with exposed secrets'          │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 RESULTADO ESPERADO:
🔍 Iniciando validación de seguridad local...

ƒôï Buscando secretos en el código...
⚠️  Posible secreto encontrado - revisar el commit
⚠️  Posible secreto encontrado - revisar el commit
⚠️  Posible secreto encontrado - revisar el commit

Secretos detectados: 3
Archivos sensibles: 1

❌ COMMIT BLOQUEADO: Se detectaron problemas de seguridad
"

echo ""
echo "📝 NARRACIÓN MIENTRAS SE BLOQUEA:
'¡Y aquí es donde entra en juego el pre-commit hook!
Noten que el hook:
1. Detectó 3 secretos en el código
2. Detectó que intentamos agregar un archivo sensible
3. BLOQUEÓ el commit ANTES de que fuera enviado a GitHub

Esto es crucial. Sin esta capa local, estos secretos hubieran sido expuestos.
Ahora vamos a corregir el código...'
"

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 3: CORRECCIÓN DEL CÓDIGO (~ 3-4 minutos)
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 3: CORRECCIÓN - MOVER SECRETOS A VARIABLES DE ENTORNO"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""

echo "✅ PASO 1: Ver el código corregido"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ cat src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN:
'Ahora vemos el código CORREGIDO. Los cambios:
- En lugar de: private static final String API_KEY = \"sk_live_...\";
- Usamos: private static final String API_KEY = System.getenv(\"API_KEY\");

De esta manera, los secretos se pasan como variables de entorno, NO están en el código.
Esto es una BEST PRACTICE de seguridad.

También hemos agregado .env al .gitignore, así nunca será commiteado.'
"

echo ""
echo "✅ PASO 2: Ver .gitignore (agregamos .env)"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ head -15 .gitignore                                                           │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN:
'Aquí agregamos .env al .gitignore. Esto asegura que el archivo de variables
de entorno NUNCA será trackeado por git, incluso si alguien intenta agregarlo.
Es una capa adicional de protección.'
"

echo ""
echo "✅ PASO 3: Ver .env.example (plantilla)"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ cat .env.example                                                              │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN:
'Este es .env.example, una plantilla que muestra DÓNDE van puesto los secretos,
pero no contiene valores reales. Los desarrolladores copian esto a .env y lo llenan
con valores reales.'
"

echo ""
echo "✅ PASO 4: Intentar commit nuevamente (SERÁ PERMITIDO)"
echo ""
echo "Comandos:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ git add .                                                                     │"
echo "│ git commit -m 'DEMO-2: Fix - Move secrets to environment variables'          │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 RESULTADO ESPERADO:
🔍 Iniciando validación de seguridad local...

Secretos detectados: 0
Archivos sensibles: 0

✅ Validación de seguridad EXITOSA
🚀 Permitiendo commit...

[main dfcbb3d] DEMO-2: Fix - Move secrets to environment variables
"

echo ""
echo "📝 NARRACIÓN MIENTRAS SE PERMITE:
'¡Excelente! Ahora el pre-commit hook permitió el commit porque:
1. No hay secretos hardcodeados en el código
2. No hay archivos sensibles siendo tracked
3. El código está seguro

Aquí es donde la primera capa de validación nos protegió. Ahora vamos a push
a GitHub, donde entra en juego la segunda capa: GitHub Actions.'
"

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 4: GITHUB ACTIONS (~ 3-4 minutos)
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 4: PUSH A GITHUB Y GITHUB ACTIONS"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""

echo "📤 PASO 1: Hacer push a GitHub"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ git push origin main                                                          │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN MIENTRAS HACE PUSH:
'Ahora estamos enviando nuestro código a GitHub. Cuando hacemos push,
automáticamente se triggerea el GitHub Actions workflow. Veamos...'
"

echo ""
echo "📊 PASO 2: Ir a GitHub Actions"
echo ""
echo "URL:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ https://github.com/juanescan/Seguridad-en-Entornos-locales/actions           │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 NARRACIÓN MIENTRAS MUESTRAS GITHUB ACTIONS:
'GitHub Actions está ejecutando nuestro pipeline de seguridad.
Vemos 7 etapas ejecutándose:

1️⃣  🔍 Detect Secrets - GitGuardian escaneando secretos expuestos
    Status: ✅ (Si hay secretos, fallaría)

2️⃣  🔐 CodeQL Analysis - Análisis estático de código (SAST)
    Status: ✅ (Busca vulnerabilidades en el código)

3️⃣  🛡️ Dependency Check - Verifica dependencias vulnerables
    Status: ✅ (Revisa que Maven/libs no tengan CVEs)

4️⃣  🧪 Unit Tests - Pruebas unitarias del código
    Status: ✅ (Garantiza que funciona)

5️⃣  🐳 Build Docker Image - Construye la imagen Docker
    Status: ✅ (Crea un contenedor listo para producción)

6️⃣  ☁️ Deploy to Azure - Despliega automáticamente
    Status: ⏳ (Espera credenciales de Azure configuradas)

7️⃣  📢 Notify Success - Envía notificación
    Status: ⏳ (Se ejecuta cuando todo pasa)

Esta es la SEGUNDA CAPA de validación. Aunque el código pasó la Primera capa
(pre-commit local), aquí tenemos validadores adicionales en la nube.'
"

echo ""
echo "📝 PASO 3: Mostrar detalles de un validador"
echo ""
echo "Haz click en la etapa '🔍 Detect Secrets' para ver detalles:"
echo "Se abrirá mostrando:"
echo "  ✅ No se encontraron secretos"
echo "  ✅ Validación exitosa"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 5: DEPLOY EN AZURE (~ 2-3 minutos) - OPCIONAL
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 5: DEPLOY EN AZURE (OPCIONAL - Solo si está configurado)"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""

echo "⚠️  NOTA: Esta escena solo funcionará si has configurado Azure previamente."
echo "Si NO lo has hecho, puedes saltarla."
echo ""

echo "☁️ PASO 1: Configura credenciales de Azure (si aún no lo hiciste)"
echo ""
echo "Necesitas:"
echo "  1. Una cuenta de Azure con créditos gratuitos"
echo "  2. Crear un App Service en Azure"
echo "  3. Agregar GitHub Secrets:"
echo ""
echo "En GitHub (Settings > Secrets and variables > Actions), agrega:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ AZURE_CREDENTIALS: (output del az ad sp create-for-rbac)                     │"
echo "│ AZURE_APP_NAME: (nombre de tu App Service)                                   │"
echo "│ GITGUARDIAN_API_KEY: (token de GitGuardian - opcional)                       │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""

echo "☁️ PASO 2: Ver el status en Azure Portal"
echo ""
echo "URL:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ https://portal.azure.com                                                      │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "Navega a: App Services > Tu App > Overview"
echo ""
echo "📝 NARRACIÓN:
'Aquí vemos el Azure App Service corriendo. El pipeline automáticamente:
1. Construyó la imagen Docker
2. Envió a Azure Container Registry
3. Desplegó en App Service
4. La aplicación está VIVA en la nube'
"

echo ""
echo "☁️ PASO 3: Probar el endpoint"
echo ""
echo "Comando:"
echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│ curl https://TU-APP-NAME.azurewebsites.net/api/security/status               │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
echo "📝 RESPUESTA ESPERADA:
{
  \"status\": \"Service running correctly\"
}
"

echo ""
echo "📝 NARRACIÓN FINAL:
'¡Y aquí está! La aplicación desplegada en Azure y respondiendo.
Recuerden que TODO esto sucedió automáticamente después del push:
- Validaciones de seguridad ejecutadas
- Imagen Docker construida
- Desplegada en la nube
- Sin intervención manual

Eso es la Doble Validación de Seguridad en acción.'
"

# ═══════════════════════════════════════════════════════════════════════════════
# ESCENA 6: CONCLUSIÓN (~ 1-2 minutos)
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo "══════════════════════════════════════════════════════════════════════════════"
echo "🎬 ESCENA 6: CONCLUSIÓN"
echo "══════════════════════════════════════════════════════════════════════════════"
echo ""

echo "📝 NARRACIÓN FINAL:

'En resumen, hemos visto cómo implementar Doble Validación de Seguridad:

🎯 PRIMER FILTRO - Local (Pre-Commit Hooks):
   ✅ Bloquea secretos ANTES de ir a GitHub
   ✅ Ejecuta instantálneamente en la máquina del desarrollador
   ✅ Arresta problemas temprano

🎯 SEGUNDO FILTRO - Nube (GitHub Actions):
   ✅ Ejecuta 7 etapas de validación
   ✅ Incluye: secrets scanning, SAST, dependency check, tests
   ✅ Detiene problemas ANTES del deployment

🎯 RESULTADO:
   ✅ Código seguro en GitHub
   ✅ Aplicación segura en Azure
   ✅ Pipeline totalmente automatizado

Este enfoque de \"Doble Validación\" es una best practice en DevSecOps moderno.
Evita errores humanos y asegura que solo código seguro llegue a producción.

Gracias por ver este video. ¡Recuerda: La seguridad es responsabilidad de todos!'
"

echo ""
echo "═════════════════════════════════════════════════════════════════════════════════"
echo "✅ FIN DE LA GUÍA"
echo "═════════════════════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Duración total: 12-15 minutos"
echo "📝 Puntos clave para tu presentación:"
echo "   1. Muestra ambos casos (fallo y éxito)"
echo "   2. Explain cada etapa del pipeline"
echo "   3. Destaca la automatización"
echo "   4. Menciona beneficios de seguridad"
echo ""
echo "🎬 Tips de presentación:"
echo "   • Habla lentamente y claramente"
echo "   • Pausa entre secciones"
echo "   • Muestra los logs/outputs completos"
echo "   • Explica QUÉ se está haciendo"
echo "   • Explica POR QUÉ es importante"
echo ""
