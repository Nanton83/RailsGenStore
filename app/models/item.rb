class Item < ApplicationRecord   
    belongs_to :distributor
    belongs_to :store
end
