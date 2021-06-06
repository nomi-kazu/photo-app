require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }

  context '内容が保存されている場合' do
    let!(:post) { build(:post, user: user) }

    it '内容が保存できる' do
      expect(post).to be_valid
    end
  end

  context '内容が入力されていない場合' do
    let!(:post) { build(:post, content: '', user: user) }

    before do
      post.save
    end

    it '記事を保存できない' do
      expect(post.errors.messages[:content][0]).to eq("can't be blank")
    end
  end
end