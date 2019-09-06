class User < ApplicationRecord

  validates :first_name, :email, presence: true

  has_many :rentals

end