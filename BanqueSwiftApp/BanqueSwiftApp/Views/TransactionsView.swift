import SwiftUI

struct TransactionsView: View {
    @State private var transactions: [Transaction] = []
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading...")
                } else {
                    List(transactions) { transaction in
                        HStack {
                            Text(transaction.type)
                            Spacer()
                            Text("\(transaction.amount, specifier: "%.2f") €")
                        }
                    }
                }
            }
            .navigationTitle("Transactions")
            .onAppear(perform: loadTransactions)
        }
    }

    private func loadTransactions() {
        // Call the API to fetch transactions
        // For now, we will simulate loading data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.transactions = [
                Transaction(id: UUID(), type: "Deposit", amount: 1000.0, date: Date()),
                Transaction(id: UUID(), type: "Withdrawal", amount: 500.0, date: Date()),
                Transaction(id: UUID(), type: "Deposit", amount: 200.0, date: Date())
            ]
            self.isLoading = false
        }
    }
}