import Foundation

class User {
    var accountNumber: String
    var firstName: String
    var lastName: String
    var balance: Double

    init(accountNumber: String, firstName: String, lastName: String, balance: Double = 0.0) {
        self.accountNumber = accountNumber
        self.firstName = firstName
        self.lastName = lastName
        self.balance = balance
    }

    func toDictionary() -> [String: Any] {
        return [
            "accountNumber": accountNumber,
            "firstName": firstName,
            "lastName": lastName,
            "balance": balance
        ]
    }
}