class Order < ApplicationRecord

    belongs_to :user

    enum status: [:pending, :prepared]
end
