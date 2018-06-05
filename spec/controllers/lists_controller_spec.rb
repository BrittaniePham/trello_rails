require 'rails_helper'
require 'pry' 
RSpec.describe ListsController, type: :controller do

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

end
