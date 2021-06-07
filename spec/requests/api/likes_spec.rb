require 'rails_helper'

RSpec.describe 'Api::Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:like) { create(:like, user_id: user.id, post_id: post.id) }

  describe 'POST /api/likes' do 
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '200ステータスが返ってくる' do
        post api_like_path(post_id: post.id)
        expect(response).to have_http_status(200)
        body = JSON.parse(response.body)
        expect(body['status']).to eq 'ok'
      end
    end
  end

  describe 'DELETE /api/likes' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '200ステータスが返ってくる' do
        delete api_like_path(post_id: post.id)
        expect(response).to have_http_status(200)
        body = JSON.parse(response.body)
        expect(body['status']).to eq 'ok'
      end
    end
  end
end