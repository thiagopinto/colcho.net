class Room < ActiveRecord::Base
  belongs_to :user
  
  def full_name
    "#{title}, #{location}"
  end
end
