import XCTest
@testable import BanqueSwiftApp

class BanqueSwiftAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserInitialization() throws {
        let user = User(accountNumber: "4538756772", firstName: "Ernest", lastName: "YOMBI", balance: 1000.0)
        XCTAssertEqual(user.accountNumber, "4538756772")
        XCTAssertEqual(user.firstName, "Ernest")
        XCTAssertEqual(user.lastName, "YOMBI")
        XCTAssertEqual(user.balance, 1000.0)
    }

    func testTransactionInitialization() throws {
        let transaction = Transaction(type: "deposit", amount: 1000.0, date: Date(), userId: "4538756772")
        XCTAssertEqual(transaction.type, "deposit")
        XCTAssertEqual(transaction.amount, 1000.0)
        XCTAssertNotNil(transaction.date)
        XCTAssertEqual(transaction.userId, "4538756772")
    }

    func testUserBalanceUpdate() throws {
        var user = User(accountNumber: "4538756772", firstName: "Ernest", lastName: "YOMBI", balance: 1000.0)
        user.balance += 500.0
        XCTAssertEqual(user.balance, 1500.0)
        
        user.balance -= 200.0
        XCTAssertEqual(user.balance, 1300.0)
    }
}