class User < ApplicationRecord

  validates :first_name, :email, presence: true

end