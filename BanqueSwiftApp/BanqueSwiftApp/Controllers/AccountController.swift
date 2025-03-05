import Foundation
import SwiftUI

class AccountController: ObservableObject {
    @Published var balance: Double = 0.0
    @Published var transactions: [Transaction] = []
    
    func fetchBalance(accountNumber: String) {
        // Call API to fetch balance for the given account number
        APIService.shared.getBalance(accountNumber: accountNumber) { result in
            switch result {
            case .success(let balance):
                DispatchQueue.main.async {
                    self.balance = balance
                }
            case .failure(let error):
                print("Error fetching balance: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchTransactions(accountNumber: String) {
        // Call API to fetch transactions for the given account number
        APIService.shared.getTransactions(accountNumber: accountNumber) { result in
            switch result {
            case .success(let transactions):
                DispatchQueue.main.async {
                    self.transactions = transactions
                }
            case .failure(let error):
                print("Error fetching transactions: \(error.localizedDescription)")
            }
        }
    }
    
    func deposit(amount: Double, accountNumber: String) {
        // Call API to deposit amount
        APIService.shared.deposit(amount: amount, accountNumber: accountNumber) { result in
            switch result {
            case .success(let newBalance):
                DispatchQueue.main.async {
                    self.balance = newBalance
                    self.fetchTransactions(accountNumber: accountNumber) // Refresh transactions
                }
            case .failure(let error):
                print("Error during deposit: \(error.localizedDescription)")
            }
        }
    }
    
    func withdraw(amount: Double, accountNumber: String) {
        // Call API to withdraw amount
        APIService.shared.withdraw(amount: amount, accountNumber: accountNumber) { result in
            switch result {
            case .success(let newBalance):
                DispatchQueue.main.async {
                    self.balance = newBalance
                    self.fetchTransactions(accountNumber: accountNumber) // Refresh transactions
                }
            case .failure(let error):
                print("Error during withdrawal: \(error.localizedDescription)")
            }
        }
    }
}