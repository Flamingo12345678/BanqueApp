import SwiftUI

struct AuthView: View {
    @State private var accountNumber: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var isLoginMode: Bool = true
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(isLoginMode ? "Connexion" : "Inscription")
                    .font(.largeTitle)
                    .padding()

                TextField("Numéro de compte", text: $accountNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if !isLoginMode {
                    TextField("Prénom", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Nom", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }

                SecureField("Mot de passe", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button(action: {
                    isLoginMode ? login() : register()
                }) {
                    Text(isLoginMode ? "Se connecter" : "S'inscrire")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    isLoginMode.toggle()
                }) {
                    Text(isLoginMode ? "Créer un compte" : "Déjà un compte ? Se connecter")
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .padding()
        }
    }

    private func login() {
        // Logic for user login
        // Call APIService to authenticate user
    }

    private func register() {
        // Logic for user registration
        // Call APIService to create a new user
    }
}