# ✅ CHECKLIST PRE-GRABACIÓN

## 🎬 Antes de Encender la Cámara

### Tecnología ✔️
- [ ] Java 17+ instalado
- [ ] Maven 3.8+ instalado
- [ ] Git 2.30+ instalado
- [ ] Docker instalado (opcional pero recomendado)
- [ ] Terminal funcionando correctamente
- [ ] VS Code o IDE preferido configurado

### Código ✔️
- [ ] Proyecto clonado y actualizado
- [ ] `./scripts/setup-hooks.sh` ejecutado
- [ ] `.env.example` copiado a `.env`
- [ ] `mvn clean compile` completado exitosamente
- [ ] Pre-commit hooks funcionando (probar con un archivo sensible)

### GitHub ✔️
- [ ] Cuenta GitHub creada
- [ ] Repositorio creado (privado o público, tu elección)
- [ ] Código pusheado a main branch
- [ ] GitHub Actions workflow presente en `.github/workflows/`
- [ ] Secrets configurados (si planeas CI/CD completo)

### Azure (Opcional pero para Demo Completa) ✔️
- [ ] Suscripción Azure activa (prueba gratuita = $200)
- [ ] Azure CLI instalado
- [ ] App Service creado
- [ ] Service Principal creado
- [ ] Credentials agregados a GitHub Secrets

### Hardware ✔️
- [ ] Cámara/Pantalla funcionando
- [ ] Micrófono probado
- [ ] OBS/Zoom/ScreenFlow configurado
- [ ] Almacenamiento suficiente (10GB+ libre)
- [ ] Conexión a internet *estable*

### Entorno ✔️
- [ ] Terminal en `c:\Users\JUAN\Desktop\cloudsecurity\Proyecto\ECI`
- [ ] Pantalla a resolución adecuada (1920x1080 recomendado)
- [ ] Fuente legible (aumentar zoom si es necesario)
- [ ] Modo "No Disturb" activado
- [ ] Notificaciones desactivadas

---

## 📝 Script de Video (Guión)

### Escena 1: Introducción (2 min)
```
"Hola, en este video voy a mostrar cómo implementé 
el concepto de 'doble validación de seguridad' que 
propongo en mi paper sobre cloud security.

Este proyecto demuestra cómo los secretos y 
vulnerabilidades se detectan en TRES niveles:
1. Antes de que salgan de tu computadora (pre-commit hooks)
2. Antes de que se desplieguen (GitHub Actions)
3. En la nube (Azure con monitoreo)

Vamos a hacerlo paso a paso."
```

### Escena 2: Primer Intento - FALLA (5 min)
```
"Aquí tenemos el controlador con datos sensibles 
hardcodeados deliberadamente para poder demostrarlo."

git add .
git commit -m "Add security controller"

"Como ven, el commit se bloqueó. El pre-commit hook 
detectó que hay secretos en el código."

Mostrar mensaje de error claro:
"❌ COMMIT BLOQUEADO: Se detectaron problemas de seguridad
Secretos detectados: 2"
```

### Escena 3: Corregir - ÉXITO (4 min)
```
"Ahora voy a arreglarlo moviendo los secretos 
a variables de entorno en el archivo .env"

./scripts/demo-2-fixed-state.sh

"El archivo .env está en .gitignore, así que 
nunca será commiteado a Git."

git add .
git commit -m "Fix: Move secrets to environment variables"

"Excelente, esta vez el commit pasó porque 
no hay secretos hardcodeados."
```

### Escena 4: GitHub Actions (4 min)
```
"Ahora hago push a GitHub..."

git push origin main

"En GitHub Actions, el workflow se inicia 
automáticamente. Vemos 7 etapas ejecutándose:

1. Secret Scanning - confirmó que no hay secretos
2. CodeQL - análisis estático de seguridad
3. OWASP Dependency Check - verifica librerías vulnerables
4. Unit Tests - ejecuta las pruebas
5. Docker Build - genera la imagen
6. Push a Registry - la sube
7. Deploy a Azure - si todo está bien

Todas las etapas completaron exitosamente ✅"
```

### Escena 5: Azure Deployment (3 min)
```
"Ahora la aplicación se desplegó automáticamente 
en Azure App Service.

Puedo acceder a la aplicación usando la URL..."

curl https://eci-app-[nombre].azurewebsites.net/api/security/status

"Como ven, la aplicación está respondiendo 
correctamente desde la nube."

JSON response: {"status": "Service running correctly"}
```

### Escena 6: Conclusión (2 min)
```
"Entonces lo que vimos fue:

❌ FALLA: Pre-commit hook bloqueó el secreto
✅ ÉXITO: Después de arreglarlo, permitió el commit
☁️ NUBE: GitHub Actions ejecutó 7 validaciones
🚀 DEPLOY: Azure recibió la aplicación de forma segura

Esto es 'doble validación de seguridad':
Primero prevenimos problemas localmente,
Después actuamos como respaldo en la nube.

De esta forma, los secretos NUNCA llegan a producción.

Esto es especialmente importante en equipos grandes 
donde múltiples desarrolladores push código."
```

---

## 🎥 Configuración Técnica de Grabación

### Resolución
- **Mínimo**: 1280x720 (720p)
- **Recomendado**: 1920x1080 (1080p)
- **Óptimo**: 2560x1440 (1440p)

### Bitrate
- Mínimo: 5 Mbps
- Recomendado: 10-15 Mbps

### FPS (Frames Per Second)
- 30 FPS es suficiente (video estándar)
- 60 FPS para ver scrolling más fluido

### Codec
- H.264 o VP9 (ambos soportados en YouTube)

### Audio
- Tasa de muestreo: 48 kHz
- Bitrate: 128-256 Kbps
- Mono es OK, Estéreo es mejor

---

## 🎯 Checklist Final Antes de Grabar

### Código
- [ ] `SecurityCheckController.java` tiene secretos visibles
- [ ] `.env` NO está en Git (visto en .gitignore)
- [ ] Pre-commit hook se ejecutará y bloqueará
- [ ] `demo-2-fixed-state.sh` arreglará los secretos
- [ ] Segundo commit pasará exitosamente

### GitHub
- [ ] Repositorio sincronizado
- [ ] Workflow `.yml` está presente
- [ ] GitHub Actions está habilitado

### Az ure
- [ ] App Service está creado
- [ ] Service Principal está creado
- [ ] Secrets están en GitHub

### Grabación
- [ ] OBS/zoom abierto y testeado
- [ ] Micrófono probado con audio claro
- [ ] Terminal limpia y lista
- [ ] VS Code o IDE abierto en directorio raíz
- [ ] No hay notificaciones que interrumpan

### Internet
- [ ] Conexión estable
- [ ] Mínimo 5 Mbps de upload
- [ ] No hay descargas en background

---

## ⚡ Dry Run (Prueba sin grabar)

Ejecutar esto ANTES de grabar de verdad:

```bash
# 1. Resetear a estado vulnerable
./scripts/demo-1-failed-state.sh

# 2. Intentar commit (debe fallar)
git add .
git commit -m "Test commit"  # Debe bloquearse ❌

# 3. Resetear a estado corregido
./scripts/demo-2-fixed-state.sh

# 4. Intentar commit (debe pasar)
git add .
git commit -m "Test commit fixed"  # Debe permitirse ✅

# 5. Reset a original para grabar
git reset --hard HEAD~2
```

Si todo funciona en el dry run, estás listo para grabar real.

---

## 🎬 Cuando Estés Grabando

### Velocidad
- **LENTO**: Tómate tu tiempo, no hay prisa
- **PAUSAS**: Haz pausas naturales entre secciones
- **HABLA CLARA**: Enunciación clara

### Mostrar
- **CÓDIGO**: Asegúrate que se vea claramente
- **ERRORES**: Déjalos visibles, no los cubras
- **ÉXITOS**: Muestra claramente los checkmarks ✅

### Evitar
- ❌ Hablar muy rápido
- ❌ Cambiar de tema sin transición
- ❌ Dejar código críptico sin explicar
- ❌ Olvidar de mostrar el error importante
- ❌ Corrupción del micrófono

---

## 📤 Después de Grabar

### Edición (Opcional)
- Corta secciones aburridas
- Añade subtítulos si es necesario
- Baja volumen de ruido de fondo si hay

### Subida
- Nombre en YouTube: "ECI Cloud Security Project: Doble Validación"
- Descripción: Enlaza a tu GitHub repo
- Tags: `devSecOps, security, azure, github-actions`
- Privacidad: Pública o listada según universidad

### Links Útiles en Descripción
- GitHub repo: https://github.com/tu-usuario/ECI
- Documentación: README.md
- Paper: [enlace a tu paper if applicable]

---

## 🆘 Si Algo Falta Entra Grabando

Si olvidaste instalar algo o algo falla:
1. Para la grabación
2. Arregatlo rápido
3. Reinicia desde ese punto
4. Edita después si es necesario

**Importante:** Los errores que surgen y suces que arreglas son MEJOR que todo perfecto. Muestra tu proceso real.

---

## ✨ Good Luck! 

Tienes TODO lo que necesitas. Solo entra y demuéstraselo 🎬

**Tiempo estimado total del video: 15 minutos**
