class Room < ActiveRecord::Base
  has_many: reviews, dependent: :destroy
  belongs_to :user

  def self.most_recent
    order(created_at: :desc)
  end

  def full_name
    "#{title}, #{location}"
  end
end
