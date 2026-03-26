# ⚡ QUICK START - 5 Minutos para Empezar

## 📋 Checklist Rápido

### 1️⃣ Verificar Requisitos (2 min)
```bash
java -version          # Debe ser 17+
mvn -v                 # Debe ser 3.8+
git --version          # Debe ser 2.30+
```

Si falta algo, instala desde:
- Java: https://adoptium.net/
- Maven: https://maven.apache.org/
- Git: https://git-scm.com/

### 2️⃣ Setup Inicial (2 min)
```bash
# Navegar al proyecto
cd c:\Users\JUAN\Desktop\cloudsecurity\Proyecto\ECI

# Instalar pre-commit hooks
chmod +x scripts/setup-hooks.sh
./scripts/setup-hooks.sh

# Crear archivo .env
cp .env.example .env
```

### 3️⃣ Compilar (1 min)
```bash
mvn clean compile
```

✅ **¡Listo!**

---

## 🎬 Para Grabar el Video (30 minutos)

### Demo en 4 Pasos:

#### Paso 1: Estado Vulnerable ❌
```bash
./scripts/demo-1-failed-state.sh
git add .
git commit -m "Add vulnerable code"
# Se bloqueará aquí
```

#### Paso 2: Corregir
```bash
./scripts/demo-2-fixed-state.sh
git add .
git commit -m "Fix: Use environment variables"
# Ahora pasa
```

#### Paso 3: Push a GitHub
```bash
git push origin main
# Ver en: https://github.com/tu-usuario/ECI/actions
```

#### Paso 4: Deploy en Azure
Sigue: [AZURE_SETUP.md](./AZURE_SETUP.md)

---

## 📚 Documentación

| Archivo | Para |
|---------|------|
| [RESUMEN_EJECUTIVO.md](./RESUMEN_EJECUTIVO.md) | Entender qué se creó |
| [README.md](./README.md) | Referencia completa |
| [VIDEO_DEMO_GUIDE.md](./VIDEO_DEMO_GUIDE.md) | Grabar video paso a paso |
| [AZURE_SETUP.md](./AZURE_SETUP.md) | Configurar Azure |

---

## ❓ Problemas Comunes

| Problema | Solución |
|----------|----------|
| `pre-commit: command not found` | `chmod +x .git/hooks/pre-commit` |
| `mvn: command not found` | Instala Maven |
| `git commit se bloquea` | Es normal (está detectando secretos) |
| `Azure login falla` | Verifíca credenciales en GitHub Secrets |

---

## 🎯 Lo Que Verás en el Video

1. **Commit bloqueado** (pre-commit hook detecta secretos) ❌
2. **Secretos movidos a .env** (archivo protegido)
3. **Commit permitido** ✅
4. **GitHub Actions ejecutándose** (7 etapas)
5. **Deploy a Azure** 🚀
6. **API respondiendo** (desde la nube)

---

## 🚀 Ir Directo al Código

```bash
cd c:\Users\JUAN\Desktop\cloudsecurity\Proyecto\ECI

# Ver el código con vulnerabilidades
code src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java

# Ver el pre-commit hook
code .git/hooks/pre-commit

# Ver el workflow de Actions
code .github/workflows/security-pipeline.yml
```

---

## 💡 Consejo Principal

**Lo más importante es mostrar:**
1. El error (secreto detectado)
2. La corrección (mover a .env)
3. El éxito (commit permitido, Actions pasando, Deploy en Azure)

Eso es TODO lo que necesitas para nota alta.

---

**¡Próxima parada: [VIDEO_DEMO_GUIDE.md](./VIDEO_DEMO_GUIDE.md) para grabar! 🎬**
