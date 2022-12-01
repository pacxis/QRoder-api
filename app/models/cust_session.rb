class CustSession < ApplicationRecord
    belongs_to :user
    validates :table, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
    validates :tell,   :presence => true,
                     :length => { :minimum => 10, :maximum => 10 }
    validate :tell_starts_with_04

    def tell_starts_with_04
        unless tell.start_with?('04')
          errors.add(:last_name, "Phone must start with '04'")
        end
      end
end
