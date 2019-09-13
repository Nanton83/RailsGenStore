class Store < ApplicationRecord
    has_many :items
    has_many :distributors, through: :items
end
