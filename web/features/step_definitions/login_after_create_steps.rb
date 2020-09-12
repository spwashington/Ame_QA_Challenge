Given("user create a new account") do
    @m_Email = "teste#{rand(1...999999)}@teste#{rand(1...999999)}.com"
    @m_Password = "123456"
    @m_Page.m_CheckEmailInput.set @m_Email
    @m_Page.m_CreateAccountButton.click
    @m_Page.createAccount @m_Password
end

Then("user can login in website with your created account") do
    @m_Page.m_LogoutButton.click
    @m_Page.login @m_Email, @m_Password
    expect(page).to have_content("Welcome to your account. Here you can manage all of your personal information and orders.")
end