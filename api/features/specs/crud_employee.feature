Feature: CRUD API
    API should able to execute a crud in database

    Background: Setup API
        Given the API address

    @CreateEmployee
    Scenario: Create employee
        Given a data of a new employee
        |   Name    |   Tony    |
        |   Age     |   35      |
        |   Salary  |   4500    |
        When send a post request to create 
        Then API should return a "success" with message: "Successfully! Record has been added." and Status code: 200
        And employee should avaliable in database

    @GetEmployee
    Scenario: Read employee
        When send a get request with employee 1
        Then Api should return a "success" and status code: 200

    ##TODO
    # Scenario: Update employee

    @DeleteEmployee
    Scenario: Delete employee
    #remover: t, te, tes, test, test1, test2, test3. test4, test5, test6, test7, test8