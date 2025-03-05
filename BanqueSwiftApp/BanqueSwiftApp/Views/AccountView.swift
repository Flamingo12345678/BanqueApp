import SwiftUI

struct AccountView: View {
    @State private var balance: Double = 0.0
    @State private var accountNumber: String = ""
    @State private var depositAmount: String = ""
    @State private var withdrawAmount: String = ""
    
    var body: some View {
        VStack {
            Text("Informations du Compte")
                .font(.largeTitle)
                .padding()
            
            Text("Numéro de Compte: \(accountNumber)")
                .font(.headline)
            
            Text("Solde: \(balance, specifier: "%.2f") €")
                .font(.title)
                .padding()
            
            HStack {
                TextField("Montant à Déposer", text: $depositAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .border(Color.gray)
                
                Button(action: {
                    deposit()
                }) {
                    Text("Déposer")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding()
            
            HStack {
                TextField("Montant à Retirer", text: $withdrawAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .border(Color.gray)
                
                Button(action: {
                    withdraw()
                }) {
                    Text("Retirer")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding()
        }
        .onAppear {
            fetchAccountDetails()
        }
    }
    
    private func fetchAccountDetails() {
        // Logic to fetch account details from the backend
    }
    
    private func deposit() {
        // Logic to handle deposit
    }
    
    private func withdraw() {
        // Logic to handle withdrawal
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}