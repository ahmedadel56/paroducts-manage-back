class Bill < ApplicationRecord
    has_many :bill_products , dependent: :destroy
    belongs_to :customer , optional: true
end
