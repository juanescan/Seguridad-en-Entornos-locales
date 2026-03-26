#!/bin/bash
# Script para demostración de "CASO FALLIDO"
# Resetea el proyecto a estado vulnerable
# Uso: ./scripts/demo-1-failed-state.sh

echo "🔴 PREPARANDO DEMO 1: CASO FALLIDO (Secreto Expuesto)"
echo "════════════════════════════════════════════════════════"
echo ""

# Asegurar que el controlador tiene secretos hardcodeados
echo "📝 Verificando que SecurityCheckController tiene secretos expuestos..."

# Crear el archivo con secretos
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

    // 🔴 VULNERABILIDAD INTENCIONAL: API Key expuesta en el código
    private static final String API_KEY = "DEMO_API_KEY_EXAMPLE_12345";
    private static final String DB_PASSWORD = "DEMO_PASSWORD_EXAMPLE_67890";

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
        return "{\"api_key\": \"" + API_KEY + "\"}";
    }

    public static class AuthRequest {
        private String apiKey;
        public String getApiKey() { return apiKey; }
        public void setApiKey(String apiKey) { this.apiKey = apiKey; }
    }
}
EOF

echo "✅ Archivo actualizado con secretos"
echo ""
echo "📝 Pasos para reproducir en el video:"
echo "   1. git add ."
echo "   2. git commit -m 'Add security controller'"
echo "   3. 🔴 Pre-commit hook BLOQUEARÁ el commit"
echo ""
echo "✅ Estado de demostración listo: FALLIDO"
echo ""
