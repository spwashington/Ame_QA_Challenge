Feature: Create a new product
    In app should be possible create a new product in list
        - Must have a button NEW
        - Must have a screen to add information about product
        - Description, amount and unit value is a required field

    Background: Open new register
        When user click in button new in register product screen
        Then screen to add information about a new product appears

    @NewProdWR
    Scenario: Add product with required field
        When the user fills the all required field and click in save button
            |   Description |  Test Product     |
            |   Amount      |       1           |
            |   Value       |       2.00        |
        Then the new product is add in register product screen

    @NewProdFull
    Scenario: Add product with all information
        When the user fills the all fields and click in save button
            |   Code        |    test123    |
            |   Description |  Test Product |
            |   Unit        |    testABC    |
            |   Amount      |       1       |
            |   Value       |       1.00    |
            |   Batch       |   test123abc  |
            |   Validate    |   13/09/2021  |
        Then the new product is add in register product screen

    @NewProdErr
    Scenario Outline: Add product without required field
        When the user fills the some fields and click in save button
            |   Code        |    test123    |
            |   Description | <Description> |
            |   Unit        |    testABC    |
            |   Amount      |   <Amount>    | 
            |   Value       |   <Value>     |
            |   Batch       |   test123abc  |
        Then in required fields should appears feedback about problem and can't be add this product

        Examples:
        |    Description    |   Amount    |   Value    |
        |                   |             |            |
        |     teste123      |             |            |
        |     teste123      |      1      |            |
        |     teste123      |             |     1.00   |
        |                   |      1      |            |
        |                   |      1      |     1.00   |
        |                   |             |     1.00   |
        