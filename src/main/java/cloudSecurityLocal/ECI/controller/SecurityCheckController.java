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
    // Ejemplo de vulnerable (NO USAR NUNCA): private static final String API_KEY = "sk_prod_1234...";
    // Lo correcto es:
    private static final String API_KEY = System.getenv("API_KEY");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @GetMapping("/status")
    public String getStatus() {
        return "{\"status\": \"Service running correctly\"}";
    }

    @GetMapping("/check")
    public String checkSecurity() {
        // Simulando una verificación de seguridad
        return "{\"security_level\": \"high\", \"vulnerabilities\": 0}";
    }

    @PostMapping("/authenticate")
    public String authenticate(@RequestBody AuthRequest request) {
        // 🔴 Credenciales hardcodeadas
        if (request.getApiKey().equals(API_KEY)) {
            return "{\"authenticated\": true, \"message\": \"Login successful\"}";
        }
        return "{\"authenticated\": false, \"message\": \"Invalid credentials\"}";
    }

    @GetMapping("/config")
    public String getConfig() {
        // 🔴 Exponiendo información sensible
        return "{\"api_key\": \"" + API_KEY + "\", \"db_password\": \"" + DB_PASSWORD + "\"}";
    }

    public static class AuthRequest {
        private String apiKey;

        public String getApiKey() {
            return apiKey;
        }

        public void setApiKey(String apiKey) {
            this.apiKey = apiKey;
        }
    }
}
