require 'rails_helper'

RSpec.describe CustomerTea, type: :model do

  describe 'validations' do

    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :tea_id }

  end

end