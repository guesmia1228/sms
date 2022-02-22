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

  describe "GET #new" do
    before {get :new}

    it "Instance not saved in the bank" do
      expect(assigns(:student)).not_to be_persisted
    end
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    let(:action) {post :create, params: {student: params}}

    context "success" do
      let(:params) { {name: "Anderson"} }

      it "Redirection to Students page" do
        action
        expect(response).to redirect_to students_path
      end
      it "Student was saved" do
        # posso usar para deletar um estudante usando -1
        expect {action}.to change{Student.count}.by 1
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


end