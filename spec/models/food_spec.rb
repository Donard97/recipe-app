require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Donard', email: 'example@mail.com', password: 'password') }
  let(:food) { Food.create(user_id: user.id, name: 'Apple', measurement_unit: 'kg', price: 12) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(food).to be_valid }
    end

    it 'should allow valid name' do
      food.name = 'Egg'
      expect(food).to_not be 'Apple'
    end

    it 'should allow valid name' do
      food.name = 'Apple'
      expect(food).to be_valid
    end

    it 'should validate measurment unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it 'should validate measurment unit' do
      food.measurement_unit = 'kg'
      expect(food).to be_valid
    end

    it 'should validate price' do
      food.price = -5
      expect(food).to_not be_valid
    end

    it 'should validate price' do
      food.price = 0
      expect(food).to_not be_valid
    end

    it 'should validate price' do
      food.price = 6
      expect(food).to be_valid
    end
  end
end
