require 'rails_helper'

RSpec.describe WriteupsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      writeup = Writeup.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      writeup = Writeup.create! valid_attributes
      get :show, params: {id: writeup.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      writeup = writeup.create! valid_attributes
      get :edit, params: {id: writeup.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new writeup" do
        expect {
          post :create, params: {writeup: valid_attributes}, session: valid_session
        }.to change(writeup, :count).by(1)
      end

      it "redirects to the created writeup" do
        post :create, params: {writeup: valid_attributes}, session: valid_session
        expect(response).to redirect_to(writeup.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {writeup: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested writeup" do
        writeup = writeup.create! valid_attributes
        put :update, params: {id: writeup.to_param, writeup: new_attributes}, session: valid_session
        writeup.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the writeup" do
        writeup = writeup.create! valid_attributes
        put :update, params: {id: writeup.to_param, writeup: valid_attributes}, session: valid_session
        expect(response).to redirect_to(writeup)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        writeup = writeup.create! valid_attributes
        put :update, params: {id: writeup.to_param, writeup: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested writeup" do
      writeup = writeup.create! valid_attributes
      expect {
        delete :destroy, params: {id: writeup.to_param}, session: valid_session
      }.to change(writeup, :count).by(-1)
    end

    it "redirects to the writeups list" do
      writeup = writeup.create! valid_attributes
      delete :destroy, params: {id: writeup.to_param}, session: valid_session
      expect(response).to redirect_to(writeups_url)
    end
  end

end
