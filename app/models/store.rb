class Store < ApplicationRecord
    has_many :items
    has_many :distributers, through: :items
end
