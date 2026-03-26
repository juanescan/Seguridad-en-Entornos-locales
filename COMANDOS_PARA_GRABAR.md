# 🎬 COMANDOS LISTOS PARA GRABAR - COPIA Y PEGA

## 📋 PREPARACIÓN INICIAL

### Navegación al proyecto
```powershell
cd "c:\Users\JUAN\Documents\GitHub\Seguridad-en-Entornos-locales"
```

### Verificar que todo está listo
```powershell
git status
git log --oneline -3
```

---

## 🎬 ESCENA 1: INTRODUCCIÓN (1-2 min)

### Mostrar el pre-commit hook está activo
```powershell
Get-Content .\.git\hooks\pre-commit | Select-Object -First 20
```

### Mostrar la arquitectura del proyecto
```powershell
tree /L 2
```

---

## 🎬 ESCENA 2: CASO FALLIDO - SECRETOS EXPUESTOS (4-5 min)

### ❌ PASO 1: Mostrar el código VULNERABLE (secretos hardcodeados)
```powershell
Get-Content src\main\java\cloudSecurityLocal\ECI\controller\SecurityCheckController.java
```
**Narración:** "Aquí vemos las API keys hardcodeadas. Esto es lo que NO deben hacer"

### ❌ PASO 2: Hacer commit (SERÁ BLOQUEADO)
```powershell
git add src\main\java\cloudSecurityLocal\ECI\controller\SecurityCheckController.java
git commit -m "DEMO-1: Add security controller with exposed secrets"
```
**Esperado:** El hook bloquea el commit ❌ "COMMIT BLOQUEADO"

**Narración:** "El pre-commit hook detectó 3 secretos y bloqueó el commit. Esto es lo que queremos: protección LOCAL"

---

## 🎬 ESCENA 3: CASO EXITOSO - SECRETOS EN ENV (3-4 min)

### ✅ PASO 1: Mostrar el código CORREGIDO
```powershell
Get-Content src\main\java\cloudSecurityLocal\ECI\controller\SecurityCheckController.java
```
**Narración:** "Ahora usamos System.getenv() en lugar de hardcodear. Los secretos se pasan como variables de entorno"

### ✅ PASO 2: Mostrar .gitignore (protegiendo .env)
```powershell
Get-Content .\.gitignore | Select-Object -First 15
```
**Narración:** ".env está en .gitignore, así nunca será agregado a git accidentalmente"

### ✅ PASO 3: Mostrar .env.example (plantilla)
```powershell
Get-Content .env.example
```
**Narración:** "Esta es la plantilla. Los devs copian esto a .env y llenan con valores reales"

### ✅ PASO 4: Hacer commit (SERÁ PERMITIDO)
```powershell
git add .
git commit -m "DEMO-2: Fix - Move secrets to environment variables"
```
**Esperado:** El hook permite el commit ✅ "Validación de seguridad EXITOSA"

**Narración:** "Ahora el commit fue permitido porque no hay secretos en el código. Primera capa: ✅ COMPLETA"

---

## 🎬 ESCENA 4: GITHUB ACTIONS (3-4 min)

### 📤 PASO 1: Push a GitHub
```powershell
git push origin main
```
**Narración:** "Ahora estamos enviando a GitHub. Esto va a triggear automáticamente GitHub Actions"

### 📊 PASO 2: Ver GitHub Actions en vivo
**Abre el navegador y ve a:**
```
https://github.com/juanescan/Seguridad-en-Entornos-locales/actions
```

**Narración:** "Aquí vemos el workflow ejecutándose. 7 etapas de validación:
1. 🔍 Detect Secrets (GitGuardian)
2. 🔐 CodeQL (Análisis estático)
3. 🛡️ Dependency Check (Vulnerabilidades)
4. 🧪 Unit Tests
5. 🐳 Build Docker
6. ☁️ Deploy Azure (si está configurado)
7. 📢 Notify Success"

### 📊 PASO 3: Haz clic en una etapa para ver detalles
**Click en: '🔍 Detect Secrets'**

**Narración:** "Si hubiera secretos, esta etapa habría fallado. Como ves, todos pasan.
Segunda capa: ✅ COMPLETA"

---

## 🎬 ESCENA 5: DEPLOY EN AZURE (2-3 min) - OPCIONAL

### ⚠️ NOTA IMPORTANTE
Esta sección SOLO funciona si has configurado Azure previamente.
**Si no lo has hecho, puedes saltarla en el video.**

### ☁️ PASO 1: Verificar Azure App Service
**Abre el navegador:**
```
https://portal.azure.com
```
Navega a: App Services > Tu App > Overview

### ☁️ PASO 2: Probar el endpoint
```powershell
$response = Invoke-WebRequest -Uri "https://TU-APP-NAME.azurewebsites.net/api/security/status"
$response.Content
```
**Esperado:**
```json
{"status": "Service running correctly"}
```

**Narración:** "La aplicación está VIVA en Azure, respondiendo desde la nube.
Todo esto sucedió automáticamente después del push: validaciones, build, deploy. Tercera capa: ✅ COMPLETA"

---

## 🎬 ESCENA 6: CONCLUSIÓN (1-2 min)

**Narración:** Lee el archivo [DEMO_CONCLUSIONES.txt] (al final de esta guía)

---

## 📋 COMANDOS ÚTILES (si hay problemas)

### Si necesitas resetear al estado vulnerable
```powershell
git reset --hard HEAD^
```

### Ver los últimos 2 commits
```powershell
git log --oneline -2
```

### Ver qué archivos están listos para commit
```powershell
git status
```

### Ver los cambios que hacer commit
```powershell
git diff --cached
```

### Si el hook bloquea y necesitas forzar (NO RECOMENDADO)
```powershell
git commit --no-verify
```

---

## ⏱️ TIMING POR ESCENA

- Escena 1 (Intro): 1-2 min
- Escena 2 (Caso Fallido): 4-5 min
- Escena 3 (Caso Exitoso): 3-4 min
- Escena 4 (GitHub Actions): 3-4 min
- Escena 5 (Azure): 2-3 min (opcional)
- Escena 6 (Conclusión): 1-2 min
- **TOTAL: 12-15 minutos**

---

## ✅ CHECKLIST ANTES DE GRABAR

- [ ] Terminal es visible y legible
- [ ] Git status está limpio
- [ ] Pre-commit hook está activo
- [ ] Cámara/audio funcionando
- [ ] No hay distracciones de fondo
- [ ] GitHub account accesible
- [ ] Azure Portal accesible (si vas a mostrar)
- [ ] Micrófono probado
- [ ] Suficiente espacio en disco para grabar

---

## 🎤 PUNTOS CLAVE DE NARRACIÓN

**DI ESTAS COSAS en el video:**

1. "Local validation es RÁPIDO" (pre-commit hooks)
2. "Cloud validation es COMPLETO" (GitHub Actions)
3. "Juntos crean una defensa robusta" (Doble validación)
4. "Sin esto, los secretos terminarían en GitHub"
5. "Esto es DevSecOps moderno"
6. "La seguridad debe ser automatizada, no manual"

---

## 🚀 BONUS: Si quieres impresionar

### Mostrar el .github/workflows/security-pipeline.yml
```powershell
Get-Content .\.github\workflows\security-pipeline.yml | Select-Object -First 30
```

### Mostrar las dependencias del proyecto
```powershell
Get-Content pom.xml | Select-String "dependency" -A 3 | Select-Object -First 20
```

### Mostrar logs de Maven compile
```powershell
mvn clean compile
```

---

## 📝 PLANTILLA DE NARRACIÓN FINAL

"En conclusión, hemos visto cómo implementar Doble Validación de Seguridad:

**Capa 1 - Local:**
Pre-commit hooks que bloquean secretos ANTES de GitHub.
Ejecuta en milisegundos en tu máquina.

**Capa 2 - Nube:**
GitHub Actions que ejecuta 7 validadores de seguridad.
Detecta problemas complejos que el hook local no puede.

**Resultado:**
- Código seguro llega a GitHub
- Aplicación segura se deployed a Azure
- Todo automatizado, sin intervención manual
- Developers pueden enfocarse en features, no en security

Este es el futuro de development. Gracias."

---

**¡LISTO PARA GRABAR! 🎬**
