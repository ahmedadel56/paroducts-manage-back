class Product < ApplicationRecord
    has_many :bill_products
    has_many :bill, :through => :bill_products
end
