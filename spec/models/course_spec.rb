require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    describe '#name' do
      before { subject.valid? }
      context 'When the name is nil' do
        it 'an error must be associated with the name' do
          expect(subject.errors[:name]).not_to be_empty
        end
      end
    end
  end
end