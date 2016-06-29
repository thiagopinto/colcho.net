class RoomPresenter
  delegate :user, :created_at, :description, :location, :title, :to_param, :reviews, to: :@room

  def self.model_name
    Room.model_name
  end
  
end
