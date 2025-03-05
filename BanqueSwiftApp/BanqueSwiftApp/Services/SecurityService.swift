import Foundation
import CryptoKit

class SecurityService {
    
    func hashPassword(password: String) -> String {
        let salt = generateSalt()
        let saltedPassword = salt + password
        let hashed = SHA256.hash(data: Data(saltedPassword.utf8))
        return "\(salt):\(hashed.compactMap { String(format: "%02x", $0) }.joined())"
    }
    
    func checkPassword(password: String, hashedPassword: String) -> Bool {
        let components = hashedPassword.split(separator: ":")
        guard components.count == 2, let salt = components.first else {
            return false
        }
        let hashedInput = hashPassword(password: String(salt) + password)
        return hashedInput == hashedPassword
    }
    
    private func generateSalt() -> String {
        let saltData = Data((0..<16).map { _ in UInt8.random(in: 0...255) })
        return saltData.base64EncodedString()
    }
}