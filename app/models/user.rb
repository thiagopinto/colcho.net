class User < ActiveRecord::Base
  has_many :rooms, dependent: :destroy
  has_many :reviews, dependent: :destroy
  #has_many :reviewed_rooms, through: :reviews, source: :room

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  scope :confirmed, -> { where.not(confirmed_at: nil) }

  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 30, allow_blank: false
  validate :email_format
  validates_uniqueness_of :email
  has_secure_password

  def email_format
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
  end

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end

  def self.authenticate(email, password)
    user = confirmed.find_by(email: email)
    if user.present?
      user.authenticate(password)
    end
  end

end
