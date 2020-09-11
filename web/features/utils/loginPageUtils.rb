class LoginPageUtils < SitePrism::Page
    set_url 'index.php'
    set_url "{?account_query*}"

    # MAIN PAGE
    element :m_SignInButton, "a[class='login']"
    element :m_CheckEmailInput, '#email_create'
    element :m_CreateAccountButton, '#SubmitCreate'
    element :m_LoginButton, '#SubmitLogin'
    element :m_FeedbackAlert, :xpath, '//*[@id="center_column"]/div[1]/ol/li'

    # FORM FIELDS
    element :m_RegisterAccountButton, '#submitAccount'
    element :m_MaleGenderRadio, '#id_gender1'
    element :m_FemaleGenderRadio, '#id_gender2'
    element :m_FirstNameField, '#customer_firstname'
    element :m_LastNameField, '#customer_lastname'
    element :m_EmailField, '#email'
    element :m_PasswordField, '#passwd'
    element :m_NewsletterInput, '#newsletter'
    element :m_OffersInput, '#optin'
    element :m_CompanyField, '#company'
    element :m_AddressField, '#address1'
    element :m_CityField, '#city'
    element :m_ZipcodeField, '#postcode'
    element :m_PhoneField, '#phone_mobile'
    element :m_AliasField, '#alias'

    def login(_Email, _Password)
        m_EmailField.set _Email
        m_PasswordField.set _Password
        m_LoginButton.click
    end

    def fillPersonalInformation(_Email, _UserData)
        if _UserData[:Title] == "Mr"
            m_MaleGenderRadio.click
        elsif _UserData[:Title] == "Mrs"
            m_FemaleGenderRadio.click
        end

        m_FirstNameField.set _UserData[:First_Name]
        m_LastNameField.set _UserData[:Last_Name]
        m_PasswordField.set _UserData[:Password]

        temp = _UserData[:Date_of_Birth].split('_')
        page.find_by_id('days').find("option[value='#{temp[0]}']").select_option
        page.find_by_id('months').find("option[value='#{temp[1]}']").select_option
        page.find_by_id('years').find("option[value='#{temp[2]}']").select_option

        if _UserData[:Newsletter_Agree] == "true"
            m_NewsletterInput.click
        end

        if _UserData[:Offers_Agree] == "true"
            m_OffersInput.click
        end

        m_CompanyField.set _UserData[:Comapany]
        m_AddressField.set _UserData[:Address]
        m_CityField.set _UserData[:City]

        find('#id_state option', :text => _UserData[:State]).click
        m_ZipcodeField.set _UserData[:Zip_Code]
        find('#id_country option', :text => _UserData[:Country]).click
        m_PhoneField.set _UserData[:Mobile_Phone]
        m_AliasField.set _UserData[:Alias]
    end
end