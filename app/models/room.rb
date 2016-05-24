class Room < ActiveRecord::Base
  def full_name
    "#{title}, #{location}"
  end
end
