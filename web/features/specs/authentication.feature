Feature: Authentication
    User can create a new account in website or access a already account

    Background: Access website
        Given that user access website
    
    @NewAccount
    Scenario: Create an account
        Given that user access the authentication page
        And user can add your email address to start a new register
        When user fill all personal information and click in register button
            |       Title               |       Mr                  |
            |       First_Name          |       Peter               |
            |       Last_Name           |       Parker              |
            |       Password            |       123456              |
            |       Date_of_Birth       |       1_8_1990            |
            |       Newsletter_Agree    |       true                |
            |       Offers_Agree        |       true                |
            |       Comapany            |       Neighborhood Friend |
            |       Address             |       St Marvel 3         |
            |       City                |       NY                  |
            |       State               |       New York            |
            |       Country             |       United States       |
            |       Zip_Code            |       00000               |
            |       Mobile_Phone        |       555000              |
            |       Alias               |       Spider Man          |
        Then your account is created

        @Login
        Scenario: Login in website
            Given that user access the authentication page
            When user fill fields with following data: "washingtonqa@wqa.com" and "123456"
            Then user access your account

        # Scenario: Login in website after create a new account


        @InvalidLogin
        Scenario Outline: Invalid Login in website
            Given that user access the authentication page
            When user fill fields with following data: "<Email>" and "<Password>"
            Then page show alert feedback and following "<Message>" should appears

            Examples:
            |       Email           |    Password    |               Message             |
            |                       |                |       An email address required.  |
            |   teste@teste.com     |                |       Password is required.       |
            |                       |     123456     |       An email address required.  |
            |   tttttt@ttrtrtt.frfr |     teste123   |       Authentication failed.      |
            |   teste#teste.com     |     123456     |       Invalid email address.      |
            |   teste@teste.com     |     1          |       Invalid password.           |