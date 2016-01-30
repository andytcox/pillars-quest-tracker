class Quest < ActiveRecord::Base

  def white_march?
    name.include?('[WM1]')
  end
end
