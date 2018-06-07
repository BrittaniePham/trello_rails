require 'rails_helper'
require 'pry' 
RSpec.describe ListsController, type: :controller do

  let(:valid_attributes) {
    { title: 'In Progress' }
  }

  let(:invalid_attributes) {
    { title: '' }
  }

  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :index, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :show, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :new, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :edit, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new list" do
        list = FactoryBot.create(:list)
        expect {
        post :create, params: {board_id: list.board_id, list: valid_attributes}
      }.to change(List, :count).by(1)
      end

      it "redirects to that specific board" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: valid_attributes }
        expect(response).to redirect_to(list.board)
      end
    end

    context "with invalid params" do
      it "does not create list" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: invalid_attributes }
        list.reload
        expect(list.title).to_not eq(invalid_attributes[:title])
      end

      it "returns a success response" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_attributes) {
        { title: 'New Title' }
      }

      it "updates the requested list" do
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: new_attributes }
        list.reload
        expect(list.title).to eq(new_attributes[:title])
      end

      it "redirects to requested board" do
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: new_attributes }
        expect(response).to redirect_to(list.board)
      end
    end

    context "with invalid params" do
      it "does not update list" do
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: invalid_attributes }
        list.reload
        expect(list.title).to_not eq(invalid_attributes[:title])
      end

      it "returns a success response" do
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list" do
      list = FactoryBot.create(:list)
      expect {
        delete :destroy, params: { board_id: list.board_id, id: list.id, list: valid_attributes }
      }.to change(List, :count).by(-1)
    end

    it "redirects to requested board" do
      list = FactoryBot.create(:list)
      delete :destroy, params: { board_id: list.board_id, id: list.id, list: valid_attributes }
      expect(response).to redirect_to(list.board)
    end
  end

  # describe "PUT #update_list_priority" do
  #   it "switches two lists priorities"
  #     list1 = FactoryBot.create(:list)
  #     list2 = FactoryBot.create(:list, priority: 2)

  #     put :update, params: { board_id: list.board_id, id: list.id, list: valid_attributes }
  # end

end
