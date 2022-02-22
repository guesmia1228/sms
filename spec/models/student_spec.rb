require 'rails_helper'

# RSpec.describe Student, type: :model do
#   describe 'validations' do
#     describe '#name' do
#       let(:student) { Student.new }
     
#       before { student.valid? }
#       context 'When the name is nil' do
#         it 'an error must be associated with the name' do
#           expect(student.errors[:name]).not_to eq []
#         end
#       end
#     end
#   end
# end


# subject é uma instancia da classe descrita/ é extamente Student.new
RSpec.describe Student, type: :model do
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

  describe '#generate_random_number_registration' do
  end
end



