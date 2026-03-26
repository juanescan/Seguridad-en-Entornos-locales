# 🎥 Guía de Demo: "Doble Validación de Seguridad"

## 📖 Descripción del Prototipo

Este proyecto demuestra un pipeline de seguridad en dos capas:
1. **Validación Local** (Pre-Commit Hooks): Bloquea secretos antes del commit
2. **Validación en la Nube** (GitHub Actions + Azure): Segundo filtro en deployment

## 🎬 Estructura del Video (12-15 minutos)

### Escena 1: Introducción (1-2 min)
- Mostrar la arquitectura del pipeline
- Explicar por qué "doble validación" es importante

### Escena 2: Caso FALLIDO - Secreto Expuesto (4-5 min)
1. Editor: Abrir `SecurityCheckController.java`
2. Mostrar las API keys hardcodeadas
3. Ejecutar: `git add .` y `git commit -m "Add security controller"`
4. **BLOQUEADO**: Pre-commit hook detecta secretos
   ```bash
   ❌ COMMIT BLOQUEADO: Se detectaron problemas de seguridad
   ```

### Escena 3: Corrección y Caso EXITOSO Local (3-4 min)
1. Crear `.env` con variables de entorno
2. Editar `SecurityCheckController.java`:
   ```java
   private static final String API_KEY = System.getenv("API_KEY");
   ```
3. Ejecutar commit nuevamente
4. **PERMITIDO**: Pre-commit hook ahora pasa ✅

### Escena 4: Push a GitHub y Actions (3-4 min)
1. `git push origin main`
2. Mostrar GitHub Actions ejecutándose:
   - 🔍 Detect Secrets
   - 🔐 CodeQL Analysis
   - 🛡️ Dependency Check
   - 🧪 Unit Tests
   - 🐳 Build Docker Image
3. Mostrar que TODAS las validaciones pasan

### Escena 5: Deployment a Azure (2 min)
1. Mostrar Azure Portal
2. Deploy exitoso en App Service
3. Verificar endpoint: `https://[app-name].azurewebsites.net/api/security/status`
4. Mostrar respuesta JSON exitosa

### Escena 6: Conclusión (1-2 min)
- Resumen de la "doble validación"
- Beneficios de este enfoque
- Llamada a acción

---

## 🚀 Pasos para Configurar y Grabar el Video

### Prerequisitos
- Git instalado
- Java 17+
- Maven 3.8+
- Docker instalado (opcional)
- Cuenta GitHub
- Cuenta Azure (con créditos gratuitos)

### Setup Local
```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/ECI.git
cd ECI

# 2. Instalar pre-commit hooks
chmod +x scripts/setup-hooks.sh
./scripts/setup-hooks.sh

# 3. Crear .env (git lo ignorará)
cp .env.example .env
# Editar .env con valores locales

# 4. Compilar
mvn clean compile
```

### Reproducción de Escena 2 (Caso Fallido)
```bash
# Asegurarse que SecurityCheckController.java tiene secretos hardcodeados
git add .
git commit -m "Add security controller"  # Se bloqueará aquí

# Resultado esperado:
# ❌ COMMIT BLOQUEADO: Se detectaron problemas de seguridad
# Secretos detectados: 2
```

### Reproducción de Escena 3 (Caso Exitoso)
```bash
# Editar SecurityCheckController.java para usar System.getenv()
# Crear/editar .env con los valores

git add .
git commit -m "Fix: Move secrets to environment variables"  # Ahora pasa

# Resultado esperado:
# ✅ Validación de seguridad EXITOSA
```

### Setup GitHub Actions
1. Push del código
2. Ir a: https://github.com/tu-usuario/ECI/actions
3. Ver workflow ejecutándose con 7 etapas

### Setup Azure
Ver archivo `AZURE_SETUP.md`

---

## 📋 Checklist pre-grabación

- [ ] Pre-commit hooks funcionando localmente
- [ ] API keys en variables de entorno (no hardcodeadas)
- [ ] GitHub Actions workflow configurado
- [ ] Azure App Service creado
- [ ] Credenciales de Azure configuradas en GitHub Secrets
- [ ] Terminal limpia y lista
- [ ] Zoom/OBS configurado para captura de pantalla
- [ ] Micrófono probado

---

## 💡 Scripts Rápidos para la Demo

### Demo Setup
```bash
#!/bin/bash
# Este script resetea el proyecto al estado "fallido"
git checkout HEAD -- src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java
echo "✅ Proyecto reseteado al estado vulnerable"
```

### Test Local
```bash
# Validar que un commit se bloquee
git add .
git commit -m "Test commit with secrets"

# Debería fallar con secretos detectados
```

### Test Completo
```bash
# Construir y probar localmente con Docker
docker-compose up --build
curl http://localhost:8080/api/security/status
```

---

## 📱 Notas Importantes para el Video

### Seguridad
- **NUNCA** mostrar credenciales reales de Azure/GitHub
- Usar valores de ejemplo/test que sean obviamente falsos
- Pixelizar o redirigir URLs sensibles

### Flujo Natural
- Habla en tono conversacional
- Explica cada paso antes de ejecutarlo
- Muestra los resultados completos
- Pausas naturales entre secciones

### Errores Intencionales
- Mostrar el primer intento (fallido) completo
- Dejar visible el mensaje de error
- Luego mostrar la corrección
- Luego el nuevo intento (exitoso)

### Demostración de Valor
- Enfatiza cómo el primer filtro (local) previene problemas
- Luego muestra cómo el segundo filtro (cloud) actúa como respaldo
- Explica por qué cada validación es importante

---

## 🎯 Métricas de Éxito para Calificación Alta

✅ **MOSTRADO EN VIDEO:**
- ❌ Caso fallido: Secreto detectado por pre-commit hook
- ✅ Caso exitoso: Secreto removido, commit permitido
- ☁️ GitHub Actions: Todas las 7 etapas pasando
- 🚀 Azure Deploy: Aplicación accesible en la nube

---

## 📞 Soporte

Si encuentras problemas:
1. Revisa `.git/hooks/pre-commit` - asegúrate que es ejecutable
2. Verifica que `scripts/setup-hooks.sh` se ejecutó correctamente
3. Revisa GitHub Actions logs para errores en la nube
4. Consulta `AZURE_SETUP.md` para problemas de deployment
