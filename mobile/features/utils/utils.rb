UTILS SCRIPT COMMANDS#
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

  def wait_element(_ID, _Timeout = 10)
    $driver.wait_true(timeout: _Timeout) { $driver.exists { $driver.find_element :id, _ID } }
  end
end