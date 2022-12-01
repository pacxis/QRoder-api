class Product < ApplicationRecord
  has_one_attached :image, :dependent => :destroy

  enum category: [:starters, :main, :deserts, :drinks]

end
