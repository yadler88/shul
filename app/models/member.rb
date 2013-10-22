class Member < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.postal = postal.upcase }
  before_save { self.name = name.titlecase }
  before_save { self.last_name = last_name.titlecase }
  before_save { self.address = address.titlecase }
  validates :name, presence: true, length: {maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :postal, presence: true
  validates :last_name, presence: true
  default_scope -> { order('last_name, name') }
end
