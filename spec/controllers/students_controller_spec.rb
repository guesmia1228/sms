require "rails_helper"

RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    before { get :index }
    let!(:student_01) { create(:student) }
    let!(:student_02) { create(:student) }

    it "If the controller correctly assigns @students" do
      expect(assigns(:students)).to eq [student_01, student_02]
    end
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
end