class Distributor < ApplicationRecord
    has_secure_password
    has_many :items
    has_many :stores, through: :items

    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |distributor|
            distributor.password = SecureRandom.hex
            distributor.user_name = auth_hash["info"]["nickname"]
        end
    end
end
