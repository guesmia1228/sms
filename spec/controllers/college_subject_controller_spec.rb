require 'rails_helper'

RSpec.describe CollegeSubjectsController, type: :controller do
  describe "GET #index" do
    before { get :index }

    let!(:college_subject_01) { create(:college_subject) }
    let!(:college_subject_02) { create(:college_subject) }

    it "If the controller correctly assigns @college_subjects" do
      expect(assigns(:college_subjects)).to eq [college_subject_01, college_subject_02]
    end

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end

  describe "GET #new" do
    before {get :new}

    it "Instance not saved in the bank" do
      expect(assigns(:college_subject)).not_to be_persisted
    end
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    let(:action) {post :create, params: {college_subject: params}}

    context "success" do
      let(:params) { {name: "Engenharia de Software"} }

      it "Redirection to college subject page" do
        action
        expect(response).to redirect_to college_subjects_path
      end
      it "College Subject was saved" do
        expect {action}.to change{CollegeSubject.count}.by 1
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
    let!(:college_subject) { create(:college_subject) }
    let(:action) {delete :destroy, params: id}

    context "success" do
      let(:id) { {id: college_subject.id} }

      it "deleted department" do
        expect {action}.to change{CollegeSubject.count}.by -1
      end
      it "Redirection to Departments pag" do
        action
        expect(response).to redirect_to college_subjects_path
      end
    end
  end
end