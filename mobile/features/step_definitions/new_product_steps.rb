When("user click in button new in register product screen") do
    @m_Object.wait_element "Button1"
    @m_Object.click "Button1"
end

Then("screen to add information about a new product appears") do
    @m_Object.wait_element "textView3"
    temp = @m_Object.get_element "textView3"
    expect(temp.text).to eql("Produto")
end

When("the user fills the all required field and click in save button") do |_Data|
    @m_Product = _Data.rows_hash
    @m_Object.add_text "txt_descricao", @m_Product[:Description]
    @m_Object.add_text "txt_quantidade", @m_Product[:Amount]
    @m_Object.add_text "txt_valunit", @m_Product[:Value]
    @m_Object.click "btn_gravar_assunto"
end

Then("the new product is add in register product screen") do
    @m_Object.wait_element "Button1"

    temp = @m_Object.get_element "txt_descricao"
    expect(temp.text).to eql(@m_Product[:Description])

    temp = @m_Object.get_element "txt_quantidade"
    expect(temp.text).to eql(@m_Product[:Amount])

    temp = @m_Object.get_element "txt_valunit"
    expect(temp.text).to eql(@m_Product[:Value].tr('.', ','))
end

When("the user fills the all fields and click in save button") do |_Data|
    @m_Product = _Data.rows_hash
    @m_Object.add_text "txt_codigo", @m_Product[:Code]
    @m_Object.add_text "txt_descricao", @m_Product[:Description]
    @m_Object.add_text "txt_unidade", @m_Product[:Unit]
    @m_Object.add_text "txt_quantidade", @m_Product[:Amount]
    @m_Object.add_text "txt_valunit", @m_Product[:Value]
    @m_Object.add_text "txt_lote", @m_Product[:Batch]

    temp = @m_Product[:Validate].split('/')
    calendar = @m_Object.get_elements_by_class "android.view.View"

    calendar.each do |day|
        if day.text == temp[0]
            day.click
            break
        end
    end

    @m_Object.click "btn_gravar_assunto"
end

Then("in required fields should appears feedback about problem and can't be add this product") do
pending # Write code here that turns the phrase above into concrete actions
end