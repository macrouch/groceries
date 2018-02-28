require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  describe 'GET #index' do
    it 'returns a redirect when not logged in' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns a success when logged in' do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)

      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
