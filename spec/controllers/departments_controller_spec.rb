require "rails_helper"

RSpec.describe DepartmentsController, type: :controller do
  describe "GET #index" do

    before { get :index }
    let!(:department_01) { create(:department) }
    let!(:department_02) { create(:department) }

    it "If the controller correctly assigns @departments" do
      expect(assigns(:departments)).to eq [department_01, department_02]
    end

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end

  describe "GET #new" do
    before {get :new}

    it "Instance not saved in the bank" do
      expect(assigns(:department)).not_to be_persisted
    end
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    let(:action) {post :create, params: {department: params}}

    context "success" do
      let(:params) { {name: "Computation"} }

      it "Redirection to Departments page" do
        action
        expect(response).to redirect_to departments_path
      end
      it "Department was saved" do
        # posso usar para deletar um departamento usando -1
        expect {action}.to change{Department.count}.by 1
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
    let!(:department) { create(:department) }
    let(:action) {delete :destroy, params: id}

    context "success" do
      let(:id) { {id: department.id} }

      it "deleted department" do
        expect {action}.to change{Department.count}.by -1
      end
      it "Redirection to Departments pag" do
        action
        expect(response).to redirect_to departments_path
      end
    end
  end
end