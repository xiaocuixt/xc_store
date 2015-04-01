require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :password, :confirmation => true

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def validate?(password)
    self.password == password
  end
end
