class Cart < ApplicationRecord
    belongs_to :user

    validates :user_id, uniqueness: true

    has_many :cart_items
end
