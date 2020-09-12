Given("the API address") do
    @m_ApiUrl = 'http://dummy.restapiexample.com/'
end

Given("a data of a new employee") do |_EmployeeData|
    @m_Employee = _EmployeeData.rows_hash
end

When("send a post request to create") do
    createUrl = @m_ApiUrl + 'api/v1/create'
    @m_Response = HTTParty.post(createUrl, :body => {"name":"#{@m_Employee[:Name]}","salary":"#{@m_Employee[:Salary]}","age":"#{@m_Employee[:Age]}"})
end

Then("API should return a {string} with message: {string} and Status code: {int}") do |_Status, _Message, _Code|
    expect(@m_Response.parsed_response["status"]).to eql(_Status)
    expect(@m_Response.parsed_response["message"]).to eql(_Message)
    expect(@m_Response.code).to eql(_Code)
end