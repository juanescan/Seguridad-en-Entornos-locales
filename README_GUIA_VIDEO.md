# 📚 ÍNDICE DE GUÍAS PARA GRABAR EL VIDEO

## 🎬 Elige por dónde empezar:

### Opción 1: Rápida (Solo comandos)
**Archivo:** `COPY_PASTE_COMANDOS.txt`
- ✅ Comandos exactos listos para copiar y pegar
- ✅ Timing de cada sección
- ✅ Mejor para: Si ya sabes qué hacer, solo necesitas los comandos

---

### Opción 2: Completa (Paso a paso con narración)
**Archivo:** `COMANDOS_PARA_GRABAR.md`
- ✅ Guía detallada de cada escena
- ✅ Incluye narración sugerida
- ✅ Explicación de qué esperar en cada paso
- ✅ Tips de presentación
- ✅ Mejor para: Primera vez grabando, necesitas contexto

---

### Opción 3: Muy detallada (Script ejecutable)
**Archivo:** `GUIA_COMPLETA_VIDEO.sh`
- ✅ Guía paso a paso
- ✅ Explicaciones profundas
- ✅ Notas de qué narrar en cada momento
- ✅ Mejor para: Entender TODO el proceso

---

### Opción 4: Practica primero
**Archivo:** `PRACTICE_VIDEO.sh`
- ✅ Script para practicar antes de grabar
- ✅ No graba, solo simula los pasos
- ✅ Te ayuda a ver lo que va a suceder
- ✅ Mejor para: No quieres sorpresas durante la grabación

---

---

## 🚀 FLUJO RECOMENDADO:

### Paso 1: Practica (5 min)
```bash
bash PRACTICE_VIDEO.sh
```
Esto te mostrará exactamente qué sucede cuando ejecutes los comandos.

### Paso 2: Lee la guía
Lee el archivo `COMANDOS_PARA_GRABAR.md` 
(Te da contexto y narración sugerida)

### Paso 3: Ten los comandos listos
Abre `COPY_PASTE_COMANDOS.txt` en otra ventana
(Para copiar y pegar rápidamente)

### Paso 4: Graba el video
Sigue el orden:
1. Abre la terminal
2. Abre OBS o similar para grabar pantalla
3. Sigue los comandos del archivo `COPY_PASTE_COMANDOS.txt`
4. Narra mientras ejecutas (mira el archivo `COMANDOS_PARA_GRABAR.md` para la narración)

---

---

## 📋 RESUMEN RÁPIDO: LOS 3 ARCHIVOS PRINCIPALES

| Archivo | Para qué | Cuándo usar |
|---------|----------|----------|
| **COPY_PASTE_COMANDOS.txt** | Comandos exactos | Ya practicaste, listo para grabar |
| **COMANDOS_PARA_GRABAR.md** | Guía + Narración | Primera vez, necesitas contexto |
| **PRACTICE_VIDEO.sh** | Simular sin grabar | Antes de empezar |

---

---

## ✅ CHECKLIST FINAL ANTES DE GRABAR

### Técnico
- [ ] Terminal abierta y visible
- [ ] `git status` limpio
- [ ] Pre-commit hook activo
- [ ] OBS/ScreenFlow/Similar abierto y probado
- [ ] Micrófono funciona y suena bien
- [ ] Internet funciona (para push a GitHub)

### Contenido
- [ ] Leíste "COMANDOS_PARA_GRABAR.md"
- [ ] Practicaste con "PRACTICE_VIDEO.sh"
- [ ] Tienes "COPY_PASTE_COMANDOS.txt" abierto
- [ ] Sabes qué narrar en cada paso
- [ ] Tienes 12-15 minutos libres sin interrupciones

### Calidad
- [ ] Pantalla limpia (sin ventanas extra)
- [ ] Zoom apropiado (se ve bien la terminal)
- [ ] Font legible
- [ ] Habla clara y pausada
- [ ] Pausa entre secciones para que se entienda

---

---

## 📊 ESTRUCTURA DEL VIDEO (Copiar este outline)

```
🎯 INTRO (1 min)
   - Presentar el concepto
   - Mostrar la arquitectura

❌ DEMO 1: FALLIDO (4-5 min)
   - Mostrar código vulnerable
   - Intentar commit
   - Bloqueado

✅ DEMO 2: EXITOSO (3-4 min)
   - Mostrar código corregido
   - Hacer commit
   - Permitido

📊 GITHUB ACTIONS (3-4 min)
   - Push a GitHub
   - Mostrar Actions ejecutándose
   - 7 etapas

☁️ AZURE (2-3 min) [opcional]
   - Deploy automático
   - Endpoint funcionando

📝 CONCLUSIÓN (1-2 min)
   - Resumen de Doble Validación
   - Importancia de automatizar seguridad
```

---

## 🎬 BOTÓN DE INICIO

### AHORA MISMO:
1. Abre `COPY_PASTE_COMANDOS.txt` en una ventana
2. Abre `COMANDOS_PARA_GRABAR.md` en otra
3. Abre terminal PowerShell
4. ¡Presiona record en tu programa de captura!
5. Comienza con el primer comando del archivo

---

## 📞 SI ALGO FALLA

### Pre-commit hook no bloquea:
```powershell
git reset --hard HEAD^
Get-Content .\.git\hooks\pre-commit | Select-Object -First 10
```

### Commit se está tomando mucho tiempo:
Espera. El hook está escaneando. Es normal.

### GitHub Actions no se ve:
Haz push a GitHub primero:
```powershell
git push origin main
```
Luego ve a: https://github.com/juanescan/Seguridad-en-Entornos-locales/actions

### Azure no funciona:
Salta esa sección si no está configurado.
El video es válido sin Azure.

---

## 🎉 EL MÁGICO ÚNICO COMANDO QUE EJECUTA TODO

Si solo quieres ejecutar TODOS los pasos en orden:

```powershell
# Terminal 1: Ver código
Get-Content src\main\java\cloudSecurityLocal\ECI\controller\SecurityCheckController.java

# Terminal 2: Demo fallida
git add src\main\java\cloudSecurityLocal\ECI\controller\SecurityCheckController.java
git commit -m "DEMO-1: Add security controller with exposed secrets"

# Terminal 3: Demo exitosa
git add .
git commit -m "DEMO-2: Fix - Move secrets to environment variables"

# Terminal 4: Push
git push origin main

# Luego: https://github.com/juanescan/Seguridad-en-Entornos-locales/actions
```

---

**¡LISTO PARA GRABAR! 🎬 BUENA SUERTE! 🍀**

Duración esperada: 12-15 minutos
Fecha: 25 de Marzo de 2026
Status: ✅ TODO CONFIGURADO Y PROBADO
