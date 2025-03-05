import XCTest

class BanqueSwiftAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        // Add UI tests here
        // Example: Verify that the initial screen displays the correct title
        XCTAssertTrue(app.staticTexts["Bienvenue à la Banque"].exists)
    }

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        // Simulate user login
        app.textFields["Numéro de compte"].tap()
        app.textFields["Numéro de compte"].typeText("4538756772")

        app.secureTextFields["Mot de passe"].tap()
        app.secureTextFields["Mot de passe"].typeText("votre_mot_de_passe")

        app.buttons["Se connecter"].tap()

        // Verify successful login
        XCTAssertTrue(app.staticTexts["Bienvenue, Ernest"].exists)
    }

    func testAccountBalance() throws {
        let app = XCUIApplication()
        app.launch()

        // Simulate user login
        app.textFields["Numéro de compte"].tap()
        app.textFields["Numéro de compte"].typeText("4538756772")

        app.secureTextFields["Mot de passe"].tap()
        app.secureTextFields["Mot de passe"].typeText("votre_mot_de_passe")

        app.buttons["Se connecter"].tap()

        // Check account balance
        XCTAssertTrue(app.staticTexts["Solde: 1000.0 €"].exists)
    }
}