class User < ActiveRecord::Base

has_secure_password
# validates :user_name, :email, :presence => true

end
