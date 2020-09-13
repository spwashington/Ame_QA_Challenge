Feature: CRUD API
    API should able to execute a crud in database
    - Create a new employee
    - Read a employee
    - Update a new employee
    - Delete a employee

    Background: Setup API
        Given the API address

    @Crud
    Scenario: Complete Crud in API
        Given a data of a new employee
        |   Name    |   test45    |
        |   Age     |   35      |
        |   Salary  |   4500    |
        When send a post request to create 
        Then API should return a "success" with message: "Successfully! Record has been added." and Status code: 200
        And employee should avaliable in database
        Given employee ID should be delete employee from dabatase
        Then API should return a "success" with message: "Successfully! Record has been deleted" and status code: 200
        And employee should not avaliable in database

    @CreateEmployee
    Scenario: Create employee
        Given a data of a new employee
        |   Name    |   Tony    |
        |   Age     |   35      |
        |   Salary  |   4500    |
        When send a post request to create 
        Then API should return a "success" with message: "Successfully! Record has been added." and Status code: 200

    @GetEmployee
    Scenario: Read employee
        When send a get request with employee id: 1
        Then Api should return a "success" and status code: 200

    ##TODO
    # Scenario: Update employee

    @DeleteEmployee
    Scenario: Delete employee
        When send a delete request with employee id: 24
        Then API should return a "success" with message: "successfully! deleted Records" and status code: 200