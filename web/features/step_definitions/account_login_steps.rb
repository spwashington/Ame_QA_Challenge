When("user fill fields with following data: {string} and {string}") do |_Email, _Password|
    @m_Page.login _Email, _Password
end

Then("user access your account") do
    expect(page).to have_content("Welcome to your account. Here you can manage all of your personal information and orders.")
end