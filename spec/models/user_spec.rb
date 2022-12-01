require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures password matches confirmation' do
      user = User.new(email: 'table1@qroder.com', password: 'testtest', password_confirmation: 'b',id: 1, role: "customer").save
      expect(user).to eq(false)
    end

    it 'ensures password matches confirmation' do
      user = User.new(email: 'table1', password: 'testtest', password_confirmation: 'testtest',id: 1, role: "customer").save
      expect(user).to eq(false)
    end
  end
end