import Foundation
import SwiftUI

class AuthController: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?

    private let apiService = APIService()

    func register(accountNumber: String, firstName: String, lastName: String, password: String) {
        let userData = [
            "account_number": accountNumber,
            "first_name": firstName,
            "last_name": lastName,
            "password": password
        ]

        apiService.post(endpoint: "/register", data: userData) { result in
            switch result {
            case .success(let response):
                if let user = response["user"] as? [String: Any] {
                    self.user = User(dictionary: user)
                    self.isAuthenticated = true
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func login(accountNumber: String, password: String) {
        let loginData = [
            "account_number": accountNumber,
            "password": password
        ]

        apiService.post(endpoint: "/login", data: loginData) { result in
            switch result {
            case .success(let response):
                if let user = response["user"] as? [String: Any] {
                    self.user = User(dictionary: user)
                    self.isAuthenticated = true
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}