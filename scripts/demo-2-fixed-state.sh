#!/bin/bash
# Script para demostración de "CASO EXITOSO"
# Arregla los secretos moviendo a variables de entorno
# Uso: ./scripts/demo-2-fixed-state.sh

echo "✅ PREPARANDO DEMO 2: CASO EXITOSO (Secretos en Env)"
echo "════════════════════════════════════════════════════════"
echo ""

# Crear .env
echo "📝 Creando archivo .env..."
cat > .env << 'EOF'
API_KEY=sk_test_local_development_1234567890
DB_PASSWORD=dev_password_local
SPRING_PROFILES_ACTIVE=development
EOF

echo "✅ .env creado (.gitignore lo protege)"
echo ""

# Actualizar controlador para usar variables de entorno
echo "📝 Actualizando SecurityCheckController..."
cat > src/main/java/cloudSecurityLocal/ECI/controller/SecurityCheckController.java << 'EOF'
package cloudSecurityLocal.ECI.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/security")
public class SecurityCheckController {

    // ✅ CORREGIDO: Usando variables de entorno
    private static final String API_KEY = System.getenv("API_KEY");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @GetMapping("/status")
    public String getStatus() {
        return "{\"status\": \"Service running correctly\"}";
    }

    @PostMapping("/authenticate")
    public String authenticate(@RequestBody AuthRequest request) {
        if (request.getApiKey().equals(API_KEY)) {
            return "{\"authenticated\": true}";
        }
        return "{\"authenticated\": false}";
    }

    @GetMapping("/config")
    public String getConfig() {
        return "{\"message\": \"API running securely\"}";
    }

    public static class AuthRequest {
        private String apiKey;
        public String getApiKey() { return apiKey; }
        public void setApiKey(String apiKey) { this.apiKey = apiKey; }
    }
}
EOF

echo "✅ Controlador actualizado (sin secretos hardcodeados)"
echo ""
echo "📝 Pasos para reproducir en el video:"
echo "   1. git add ."
echo "   2. git commit -m 'Fix: Move secrets to environment variables'"
echo "   3. ✅ Pre-commit hook PERMITIRÁ el commit"
echo ""
echo "✅ Estado de demostración listo: EXITOSO"
echo ""
