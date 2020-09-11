Given("that user access website") do
    @m_Page = LoginPageUtils.new
    @m_Page.load
    # @m_Page.load(account_query: {'controller': 'contact'})
end

Given("that user access the authentication page") do
    @m_Page.m_SignInButton.click
    expect(page).to have_selector('#email_create')
end

Given("user can add your email address to start a new register") do
    @m_Email = "teste#{rand(1...999999)}@teste#{rand(1...999999)}.com"
    @m_Page.m_CheckEmailInput.set @m_Email
    @m_Page.m_CreateAccountButton.click
end

When("user fill all personal information and click in register button") do |_UserData|
    userData = _UserData.rows_hash
    expect(page).to have_selector('#email')
    @m_Page.fillPersonalInformation @m_Email, userData
    @m_Page.m_RegisterAccountButton.click
    $m_Data = @m_Email + "_" + userData[:Password]
end

Then("your account is created") do
    expect(page).to have_content("Welcome to your account. Here you can manage all of your personal information and orders.")
end