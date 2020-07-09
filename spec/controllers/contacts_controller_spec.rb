require "rails_helper"

RSpec.describe ContactsController, type: :controller do
  describe 'Controller Action' do
    it 'should instantiate contact' do
      get :new
      expect(response.status).to be(200)
    end

    it 'should create contact' do
      post :create, {params: { contact: { email: 'tester@tester.com', first_name: 'John', last_name: 'Doe'}}}
      expect(response).to redirect_to contact_path
      expect(flash[:notice]).to eq('Contact created successfully!')
    end

    it 'should not create contact' do
      post :create, {params: { contact: { email: 'invalidemail', first_name: 'John', last_name: 'Doe'}}}
      expect(flash[:error]).to eq("Something went wrong!")
      expect(response).to render_template(:new)
    end
  end
end
