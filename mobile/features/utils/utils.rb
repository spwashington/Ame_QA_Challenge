#UTILS SCRIPT COMMANDS
class Utils
  def add_text(_ID, _Text, _System = "android")
    if _System == "android"
      temp = $driver.find_element :id, _ID
      temp.click
      temp.send_keys _Text
      $driver.back
    end
  end

  def click(_ID)
    temp = $driver.find_element :id, _ID
    temp.click
  end

  def get_element(_ID)
    temp = $driver.find_element :id, _ID
    return temp
  end

  def get_elements_by_class(_ClassName)
    temp = $driver.find_elements :class_name, _ClassName
    return temp
  end

  def get_element_by_class(_ClassName)
    temp = $driver.find_element :class_name, _ClassName
    return temp
  end

  def get_month_name(_Month)
    case _Month
      when 1 
        return "janeiro"
      when 2
        return "fevereiro"
      when 3
        return "março"
      when 4
        return "abril"
      when 5
        return "maio"
      when 6
        return "junho"
      when 7
        return "julho"
      when 8
        return "agosto"
      when 9
        return "setembro"
      when 10
        return "outubro"
      when 11
        return "novembro"
      else
        return "dezembro"
    end
  end

  def get_month_number(_Month)
    case _Month
      when "janeiro"
        return 1
      when "fevereiro"
        return 2
      when "março"
        return 3
      when "abril"
        return 4
      when "maio"
        return 5
      when "junho"
        return 6
      when "julho"
        return 7
      when "agosto"
        return 8
      when "setembro"
        return 9
      when "outubro"
        return 10
      when "novembro"
        return 11
      else
        return 12
    end
  end

  def set_date(_Day = 1, _Month = 1, _Year = 2020)
    #Get Next/Back buttons
    nextButton = nil
    backButton = nil
    calendarMonthYear = get_elements_by_class("android.widget.ImageButton")
    calendarMonthYear.each do |bt|
      if bt.tag_name == "Próximo mês"
        nextButton = bt
      else
        backButton = bt
      end
    end

    #Select Year
    temp = get_element_by_class("android.view.View")
    temp = temp.tag_name.split(' ')

    while temp[2].to_i != _Year.to_i
      if temp[2].to_i > _Year.to_i
        backButton.click
      else
        nextButton.click
      end

      temp = get_element_by_class("android.view.View")
      temp = temp.tag_name.split(' ')
    end

    #Select Month
    while temp[1] != get_month_name(_Month.to_i)
      if get_month_number(temp[1]) > _Month.to_i
        backButton.click
      else
        nextButton.click
      end

      temp = get_element_by_class("android.view.View")
      temp = temp.tag_name.split(' ')
    end

    #Select Day
    calendarDays = get_elements_by_class("android.view.View")
    calendarDays.each do |day|
      if day.text == _Day
          day.click
          break
      end
    end

    #Save
    button = get_elements_by_class("android.widget.Button")
    button.each do |bt|
      if bt.text == "OK"
        bt.click
      end
    end
  end


  def wait_element(_ID, _Timeout = 10)
    $driver.wait_true(timeout: _Timeout) { $driver.exists { $driver.find_element :id, _ID } }
  end
end