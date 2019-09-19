class Item < ApplicationRecord   
    belongs_to :distributor
    belongs_to :store

    scope :branded, -> (brand_name) {where("brand_name LIKE ?", brand_name)

    def branded(brand_name)
        where("brand_name LIKE ?", brand_name)
    end
end
