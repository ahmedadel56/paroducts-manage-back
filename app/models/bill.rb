class Bill < ApplicationRecord
    has_many :bill_products , dependent: :destroy
    belongs_to :customer , optional: true

    belongs_to :original_bill, class_name: 'Bill', optional: true
    has_many :returned_invoices, class_name: 'Bill', foreign_key: :original_bill_id

    accepts_nested_attributes_for :bill_products, reject_if: :all_blank, allow_destroy: true
    def as_json(options={})
        super(
          options.merge(
            include: {
              customer: {},
              bill_products: {
                include: { product: { only: :name } }
              }
            }
          )
        )
      end
end