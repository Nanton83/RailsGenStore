class Store < ApplicationRecord
    has_many :items
    has_many :distributors, through: :items
    validates :name, :presence => true
    validates :location, :presence => true
    # accepts_nested_attributes_for :items
end
