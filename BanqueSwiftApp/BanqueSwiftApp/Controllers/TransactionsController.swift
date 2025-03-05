import Foundation
import SwiftUI

class TransactionsController: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    func fetchTransactions(for accountNumber: String) {
        let url = URL(string: "http://localhost:5000/transactions/\(accountNumber)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching transactions: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.transactions = try decoder.decode([Transaction].self, from: data)
            } catch {
                print("Error decoding transactions: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func deposit(amount: Double, for accountNumber: String) {
        let url = URL(string: "http://localhost:5000/deposit")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "account_number": accountNumber,
            "amount": amount
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error during deposit: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Handle response if needed
        }
        
        task.resume()
    }
    
    func withdraw(amount: Double, for accountNumber: String) {
        let url = URL(string: "http://localhost:5000/withdraw")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "account_number": accountNumber,
            "amount": amount
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error during withdrawal: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Handle response if needed
        }
        
        task.resume()
    }
}