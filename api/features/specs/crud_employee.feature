Feature: CRUD API
    API should able to execute a crud in database

    Background: Setup API
        Given the API address

    Scenario: Create employee
        Given a data of a new employee
        |   Name    |   Tony    |
        |   Age     |   35      |
        |   Salary  |   4500    |
        When send a post request to create 
        Then API should return a "success" with message: "Successfully! Record has been added." and Status code: 200

    # Scenario: Read employee

    ##TODO
    # Scenario: Update employee

    # Scenario: Delete employee
    #remover: t, te, tes, test, test1, test2, test3. test4