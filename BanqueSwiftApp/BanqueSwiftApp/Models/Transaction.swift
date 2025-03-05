import Foundation

class Transaction {
    var id: Int
    var type: String // 'deposit' or 'withdrawal'
    var amount: Double
    var date: Date
    var userId: Int

    init(id: Int, type: String, amount: Double, userId: Int) {
        self.id = id
        self.type = type
        self.amount = amount
        self.date = Date()
        self.userId = userId
    }

    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "type": type,
            "amount": amount,
            "date": date.iso8601String(),
            "userId": userId
        ]
    }
}

extension Date {
    var iso8601String: String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}