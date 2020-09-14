When("user click in button deletar must appears confirm action popup") do
    @m_Object.click "deletar"
    temp = @m_Object.get_elements_by_class "android.widget.TextView"
    expect(temp[1].text).to eql("Confirma exclusão?")
end

Then("if user click yes the product should be remove from list") do
    button = @m_Object.get_elements_by_class "android.widget.Button"
    button.each do |bt|
        if bt.text == "SIM"
          bt.click
        end
      end

    temp = @m_Object.get_elements "deletar"
    expect(temp.count).to eql(0)
end

Then("if user click no should be cancel action and close confirm action popup") do
    button = @m_Object.get_elements_by_class "android.widget.Button"
    button.each do |bt|
        if bt.text == "NÃO"
          bt.click
          break
        end
      end

    temp = @m_Object.get_elements "deletar"
    expect(temp.count).to eql(1)
end