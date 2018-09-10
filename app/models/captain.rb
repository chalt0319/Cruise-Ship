class Captain < ApplicationRecord
  has_secure_password

  has_many :ships

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
  validates :secret_phrase, inclusion: {in: %w(ipromise)} 

end
