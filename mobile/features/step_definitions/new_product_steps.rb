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
    
    if @m_Product.count == 3
        temp = @m_Object.get_element "txt_descricao"
        expect(temp.text).to eql(@m_Product[:Description])

        temp = @m_Object.get_element "txt_quantidade"
        expect(temp.text).to eql(@m_Product[:Amount])

        temp = @m_Object.get_element "txt_valunit"
        expect(temp.text).to eql(@m_Product[:Value].tr('.', ','))
    else
        temp = @m_Object.get_element "txt_codigo"
        expect(temp.text).to eql(@m_Product[:Code])

        temp = @m_Object.get_element "txt_descricao"
        expect(temp.text).to eql(@m_Product[:Description])

        temp = @m_Object.get_element "txt_unidade"
        expect(temp.text).to eql(@m_Product[:Unit])

        temp = @m_Object.get_element "txt_quantidade"
        expect(temp.text).to eql(@m_Product[:Amount])

        temp = @m_Object.get_element "txt_valunit"
        expect(temp.text).to eql(@m_Product[:Value].tr('.', ','))

        temp = @m_Object.get_element "txt_lote"
        expect(temp.text).to eql(@m_Product[:Batch])

        temp = @m_Object.get_element "txt_validade"
        expect(temp.text).to eql(@m_Product[:Validate])
    end
end

When("the user fills the all fields and click in save button") do |_Data|
    @m_Product = _Data.rows_hash
    @m_Object.add_text "txt_codigo", @m_Product[:Code]
    @m_Object.add_text "txt_descricao", @m_Product[:Description]
    @m_Object.add_text "txt_unidade", @m_Product[:Unit]
    @m_Object.add_text "txt_quantidade", @m_Product[:Amount]
    @m_Object.add_text "txt_valunit", @m_Product[:Value]
    @m_Object.add_text "txt_lote", @m_Product[:Batch]

    @m_Object.click "data"
    temp = @m_Product[:Validate].split('/')

    @m_Object.set_date temp[0], temp[1], temp[2]
    @m_Object.click "btn_gravar_assunto"
end

When("the user fills the some fields and click in save button") do |_Data|
    @m_Product = _Data.rows_hash
    @m_Object.add_text "txt_codigo", @m_Product[:Code]
    @m_Object.add_text "txt_descricao", @m_Product[:Description]
    @m_Object.add_text "txt_unidade", @m_Product[:Unit]
    @m_Object.add_text "txt_quantidade", @m_Product[:Amount]
    @m_Object.add_text "txt_valunit", @m_Product[:Value]
    @m_Object.add_text "txt_lote", @m_Product[:Batch]
    @m_Object.click "btn_gravar_assunto"
end

Then("in required fields should appears feedback about problem and can't be add this product") do
    #TODO: Get element of feedback popup error
    @m_Object.wait_element "textView3"
    temp = @m_Object.get_element "textView3"
    expect(temp.text).to eql("Produto")
end