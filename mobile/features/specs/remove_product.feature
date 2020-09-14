Feature: Remove a product
    In app should be possible remove a product in list
        - Must have a button Remove
        - Must have a confirm action to remove

    Background: Create a product
        When user click in button new in register product screen
        Then screen to add information about a new product appears
        When the user fills the all required field and click in save button
            |   Description |  Test Product     |
            |   Amount      |       1           |
            |   Value       |       2.00        |
        Then the new product is add in register product screen

    @RemoveProd
    Scenario: Remove product in list
        When user click in button deletar must appears confirm action popup
        Then if user click yes the product should be remove from list

    @CancelDel
    Scenario: Cancel remove product action
        When user click in button deletar must appears confirm action popup
        Then if user click no should be cancel action and close confirm action popup