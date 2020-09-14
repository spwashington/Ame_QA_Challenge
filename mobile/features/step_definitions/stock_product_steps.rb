When("user click in entry button must appears screen of stock controll") do
    @m_Object.click "entrada"
    temp = @m_Object.get_element "lbl_titulo"
    expect(temp.text).to eql("Adicionar estoque")
end

Given("which product stock increase {int} units in amount") do |_Amount|
    @m_Object.add_text "txt_qtdentrada", _Amount
    @m_Type = 0
    @m_Value = _Amount.to_i
end

Then("after save this information the product should have a update your amount") do
    @m_Object.click "btn_salvar"
    temp = @m_Object.get_element "txt_quantidade"
    temp = temp.text.to_i

    if @m_Type == 0
        result = @m_Product[:Amount].to_i + @m_Value
    else
        result = @m_Product[:Amount].to_i - @m_Value
    end

    expect(temp).to eql(result)
end

When("user click in exit button must appears screen of stock controll") do
    @m_Object.click "saida"
    temp = @m_Object.get_element "lbl_titulo"
    expect(temp.text).to eql("Diminuir estoque")
end

Given("which product stock decrease {int} units in amount") do |_Amount|
    @m_Object.add_text "txt_qtdsaida", _Amount
    @m_Type = 1
    @m_Value = _Amount.to_i
end

Given("which product stock increase {string} units in amount") do |_Amount|
    @m_Value = _Amount.to_i
    @m_Object.add_text "txt_qtdentrada", _Amount
    @m_Type = 0
end

Then("in required field should appears feedback about problem and can't be updated this product") do
    #TODO: Get element of feedback popup error
    @m_Object.click "btn_salvar"
    temp = @m_Object.get_element "lbl_titulo"
    expect(temp.text).to eql("Adicionar estoque")
end