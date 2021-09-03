require 'rails_helper'

RSpec.describe Students, type: :model do
  context 'validations' do
    describe '#name' do
      it { should validate_presence_of(:name) }
    end
    describe '#registration' do
      it { should validate_presence_of(:registration) }
    end
  end
end