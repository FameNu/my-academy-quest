describe QuestsController, type: :controller do
  let(:valid_attributes) { { title: "Test Quest" } }
  let(:invalid_attributes) { { title: nil } }

  describe "GET #index" do
    before do
      Quest.destroy_all
    end

    it "returns successful or ok response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "should returns an empty quest list" do
      get :index
      expect(assigns(:quests)).to be_empty
    end

    it "should not empty the quest list" do
      Quest.create!(valid_attributes)
      get :index
      expect(assigns(:quests)).not_to be_empty
    end
  end

  describe "POST #create" do
    before do
      Quest.destroy_all
    end

    it "creates a new quest" do
      expect {
        post :create, params: { quest: valid_attributes }
      }.to change(Quest, :count).by(1)
    end

    it "when created a new quest, it redirects to the root path" do
      post :create, params: { quest: valid_attributes }
      expect(response).to redirect_to(root_path)
    end

    it "number of list will not change if create quest with invalid attributes" do
      expect {
        post :create, params: { quest: invalid_attributes }
      }.not_to change(Quest, :count)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PATCH #update" do
    let!(:quest) { Quest.create!(valid_attributes) }

    it "updates the quest's completed status" do
      expect {
        patch :update, params: { id: quest.id }
      }.to change { quest.reload.completed }.from(false).to(true)
    end

    it "redirects to the root path after updating" do
      patch :update, params: { id: quest.id }
      expect(response).to redirect_to(root_path)
    end

    it "not assigns quest id" do
      expect {
        patch :update, params: { id: "" }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "DELETE #destroy" do
    let!(:quest) { Quest.create!(valid_attributes) }

    it "deletes the quest and redirects to the root path" do
      expect {
        delete :destroy, params: { id: quest.id }
      }.to change(Quest, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end

    it "not assigns quest id, number of Quest will not change" do
      quest_before_delete = Quest.count
      expect {
        delete :destroy, params: { id: "" }
      }.to raise_error(ActiveRecord::RecordNotFound)
      expect(Quest.count).to eq(quest_before_delete)
    end

    it "delete quest with same id will not change the number of Quest" do
      atr = { title: "Another Quest" }
      Quest.create!(atr)
      expect {
        delete :destroy, params: { id: quest.id }
      }.to change(Quest, :count).by(-1)

      quest_before_delete_second_time = Quest.count
      expect {
        delete :destroy, params: { id: quest.id }
      }.to raise_error(ActiveRecord::RecordNotFound)
      expect(Quest.count).to eq(quest_before_delete_second_time)
    end
  end
end
