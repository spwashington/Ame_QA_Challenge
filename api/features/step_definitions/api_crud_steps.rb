##########CREATE NEW EMPLOYEE
Given("the API address") do
    @m_ApiUrl = 'http://dummy.restapiexample.com/'
end

Given("a data of a new employee") do |_EmployeeData|
    @m_Employee = _EmployeeData.rows_hash
end

When("send a post request to create") do
    createUrl = @m_ApiUrl + 'api/v1/create'
    @m_Response = HTTParty.post(createUrl, :body => {:name => @m_Employee[:Name], :salary => @m_Employee[:Salary], :age => @m_Employee[:Age]})
end

Then("API should return a {string} with message: {string} and Status code: {int}") do |_Status, _Message, _Code|
    expect(@m_Response.parsed_response["status"]).to eql(_Status)
    expect(@m_Response.parsed_response["message"]).to eql(_Message)
    expect(@m_Response.code).to eql(_Code)
end

##########COMPLETE CRUD
Then("employee should avaliable in database") do
    getUrl = @m_ApiUrl + "api/v1/employee/#{@m_Response.parsed_response["data"]["id"]}"
    response = HTTParty.get(getUrl)
    expect(response.code).to eql(200)
    expect(response.parsed_response["status"]).to eql("success")
end

Given("employee ID should be delete employee from dabatase") do
    deleteUrl = @m_ApiUrl + "api/v1/delete/#{@m_Response.parsed_response["data"]["id"]}"
    response = HTTParty.delete(deleteUrl)
    expect(response.code).to eql(200)
    expect(response.parsed_response["status"]).to eql("success")
end

Then("employee should not avaliable in database") do
    getUrl = @m_ApiUrl + "api/v1/employee/#{@m_Response.parsed_response["data"]["id"]}"
    response = HTTParty.get(getUrl)
    
    puts ">>>>>>>>>>>>>> CHECAR USER QDO FEZ O DELETE"
    puts response
    expect(response.code).to eql(200)
    expect(response.parsed_response["status"]).to eql("success")
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
end

##########GET A EMPLOYEE
When("send a get request with employee id: {int}") do |_ID|
    getUrl = @m_ApiUrl + "api/v1/employee/#{_ID}"
    @m_Response = HTTParty.get(getUrl)
end

Then("Api should return a {string} and status code: {int}") do |_Message, _Code|
    expect(@m_Response.code).to eql(_Code)
    expect(@m_Response.parsed_response["status"]).to eql(_Message)
end

##########DELETE A EMPLOYEE
When("send a delete request with employee id: {int}") do |_ID|
    deleteUrl = @m_ApiUrl + "api/v1/delete/#{_ID}"
    @m_Response = HTTParty.delete(deleteUrl)
end

Then("API should return a {string} with message: {string} and status code: {int}") do |_Status, _Message, _Code|
    expect(@m_Response.parsed_response["status"]).to eql(_Status)
    expect(@m_Response.code).to eql(_Code)
    expect(@m_Response.parsed_response["message"]).to eql(_Message)
end