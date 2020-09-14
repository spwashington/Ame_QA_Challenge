Feature: Stock Controller
    In app should be possible controll a product stock
        - Must have a button entry
        - Must have a button exit
        - Must have a screen to manage stock
        - Amount is a required field

    Background: Create a product
        When user click in button new in register product screen
        Then screen to add information about a new product appears
        When the user fills the all required field and click in save button
            |   Description |  Test Product     |
            |   Amount      |       10          |
            |   Value       |       2.00        |
        Then the new product is add in register product screen

    @StockAdd
    Scenario: Add amount in stock
        When user click in entry button must appears screen of stock controll
        Given which product stock increase 10 units in amount
        Then after save this information the product should have a update your amount

    @StockRem
    Scenario: Remove amount in stock
        When user click in exit button must appears screen of stock controll
        Given which product stock decrease 10 units in amount
        Then after save this information the product should have a update your amount

    @StockReq
    Scenario Outline: Add amount without required field
        When user click in entry button must appears screen of stock controll
        Given which product stock increase '<Amount>' units in amount
        Then in required field should appears feedback about problem and can't be updated this product

        Examples:
        |    Reason    |   Amount    |   Doc_Ref    |
        |              |             |              |
        |    Teste     |             |              |
        |              |             |    Teste     |
        |    Teste     |             |    Teste     |
