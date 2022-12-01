class Product < ApplicationRecord
  has_one_attached :image, :dependent => :destroy

  enum catagory: [:starters, :main, :deserts, :drinks]

end
