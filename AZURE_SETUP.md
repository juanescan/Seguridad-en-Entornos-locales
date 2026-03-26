# 🔐 Configuración de Deployment en Azure

## Prerequisitos
- Suscripción de Azure activa (prueba gratuita = $200)
- Git instalado
- Azure CLI instalado: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

## Pasos de Configuración

### 1. Crear Grupo de Recursos
```bash
az login
az group create --name eci-rg --location eastus
```

### 2. Crear App Service Plan
```bash
az appservice plan create \
  --name eci-app-plan \
  --resource-group eci-rg \
  --sku B1 \
  --is-linux
```

### 3. Crear Web App
```bash
az webapp create \
  --resource-group eci-rg \
  --plan eci-app-plan \
  --name eci-app-unique-name \
  --runtime "JAVA|17-java17"
```

### 4. Configurar Variables de Entorno
```bash
az webapp config appsettings set \
  --resource-group eci-rg \
  --name eci-app-unique-name \
  --settings \
    API_KEY=sk_test_xxxx \
    DB_PASSWORD=secure_password \
    SPRING_PROFILES_ACTIVE=production
```

### 5. Generar Credenciales para GitHub Actions

```bash
az ad sp create-for-rbac \
  --name eci-deployment \
  --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/eci-rg \
  --json-auth
```

Copiar el JSON resultado y agregarlo como secreto en GitHub:
- Nombre: `AZURE_CREDENTIALS`
- Valor: El JSON completo

### 6. Agregar Secretos en GitHub

Ve a: https://github.com/tu-usuario/ECI/settings/secrets/actions

Agrega:
- `AZURE_CREDENTIALS`: JSON de la creación de SP
- `AZURE_APP_NAME`: eci-app-unique-name
- `GITGUARDIAN_API_KEY`: Tu key de GitGuardian (opcional)

### 7. Deploy Manual (Primero)
```bash
# Para testear antes de CI/CD automatizado
az webapp up --resource-group eci-rg --name eci-app-unique-name
```

### 8. Verificar Deployment
```bash
# Ver logs de deployment
az webapp log tail --resource-group eci-rg --name eci-app-unique-name --provider web

# Hacer request al endpoint
curl https://eci-app-unique-name.azurewebsites.net/api/security/status
```

---

## Configuración de GitHub Secrets

Para que GitHub Actions pueda desplegar automáticamente:

1. Ve a Settings → Secrets and variables → Actions
2. Haz clic en "New repository secret"
3. Agrega:

```
AZURE_CREDENTIALS
AZURE_APP_NAME=eci-app-unique-name
```

---

## Costos Estimados

- App Service Plan B1: ~$12/mes
- Storage: Mínimo
- Prueba gratuita: $200 de crédito (suficiente para demo)

Para el video: Crea todo esto, hazlo una vez, luego puedes eliminar los recursos para no gastar créditos.

## Limpieza Después del Video

```bash
# Eliminar todo
az group delete --name eci-rg --yes
```

---

## Troubleshooting

### Error: "Authentication failed"
- Verifica el JSON de credenciales en GitHub Secrets

### Error: "Application failed to start"
- Verifica logs: `az webapp log tail --resource-group eci-rg --name eci-app-unique-name`
- Asegúrate que variables de entorno están configuradas

### Error: "Cannot reach endpoint"
- Espera 5-10 minutos después del deploy
- Verifica que el App Service plan está en "Running" state

---

## URL de la Aplicación

Una vez desplegada en Azure, accede a:

```
https://[azure-app-name].azurewebsites.net/api/security/status
```

Debería devolver:
```json
{"status": "Service running correctly"}
```
