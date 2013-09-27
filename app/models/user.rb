require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :drawings

  has_secure_password
end
