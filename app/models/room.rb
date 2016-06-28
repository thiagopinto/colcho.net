class Room < ActiveRecord::Base
  belongs_to :user

  def self.most_recent
    order(created_at: :desc)
  end

  def full_name
    "#{title}, #{location}"
  end
end
