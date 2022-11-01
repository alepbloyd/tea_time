require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state_ab }
  end

  describe 'relationships' do
    it { should have_many :customer_teas }
    it { should have_many(:teas).through(:customer_teas)}
  end

end
