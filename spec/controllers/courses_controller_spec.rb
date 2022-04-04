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

  describe "GET #new" do
    before {get :new}

    it "Instance not saved in the bank" do
      expect(assigns(:course)).not_to be_persisted
    end
    
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    let(:action) {post :create, params: {course: params}}

    context "success" do
      let(:params) { {name: "Computation"} }

      it "Redirection to Course page" do
        action
        expect(response).to redirect_to courses_path
      end
      it "Course was saved" do
        expect {action}.to change{Course.count}.by 1
      end
    end
    context "fail" do
      let(:params) { {name: nil} }
      it "renders the new template" do
        action
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:course) { create(:course) }
    let(:action) {delete :destroy, params: id}

    context "success" do
      let(:id) { {id: course.id} }

      it "deleted course" do
        expect {action}.to change{Course.count}.by -1
      end
      it "Redirection to Course pag" do
        action
        expect(response).to redirect_to courses_path
      end
    end
  end
end