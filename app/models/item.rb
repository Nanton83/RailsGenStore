class Item < ApplicationRecord   
    belongs_to :distributor
    belongs_to :store
    validates :name, :presence => true
    validates :brand_name, :presence => true
    validates :sku, :presence => true
    validates :price, :presence => true
    # scope :branded, -> (brand_name) {where("brand_name LIKE ?", brand_name)}
    
    # def branded(brand_name)
    #     where("brand_name LIKE ?", brand_name)
    # end
end
