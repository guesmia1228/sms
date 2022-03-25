require "rails_helper"

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    before {get :index}
    let!(:course_01) { create(:course) }
    let!(:course_02) { create(:course) }

    it "If the controller correctly assigns @courses" do
      expect(assigns(:courses)).to eq [course_01, course_02]
    end
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
end