require 'rails_helper'

RSpec.describe BulkDiscount do
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  describe 'validations' do
    it { should validate_presence_of(:percentage_discount) }
    it { should validate_numericality_of(:percentage_discount).only_integer }
    # it { should validate_length_of(:percentage_discount).is_at_most(99) }

    it { should validate_presence_of(:quantity_threshold) }
    it { should validate_numericality_of(:quantity_threshold).only_integer }
  end
end
