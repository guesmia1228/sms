require "rails_helper"

RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    before { get :index }

    it "If the controller correctly assigns @students" do
      expect(assigns(:students)).to be_empty
    end
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
end