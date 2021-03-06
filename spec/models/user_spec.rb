require 'rails_helper'

RSpec.describe User, type: :model do
  context 'account, email, passwordが入力されている場合' do
    let!(:user) { create(:user) }
    it 'ユーザーを作成できる' do
      expect(user).to be_valid
    end
  end

  context 'accountが入力できされていない場合' do 
    let!(:user) { build(:user, account: nil) }
    before do
      user.save
    end
    it 'ユーザー登録できない' do
      expect(user.errors.messages[:account][0]).to eq("can't be blank")
    end
  end

  context 'メールアドレスが入力されていない場合' do
    let!(:user) { build(:user, email: nil) }
    before do
      user.save
    end
    it 'ユーザー登録できない' do
      expect(user.errors.messages[:email][0]).to eq("can't be blank")
    end
  end

  context 'パスワードが入力されていない場合' do
    let!(:user) { build(:user, password: nil) }
    before do
      user.save
    end
    it 'ユーザー登録できない' do
      expect(user.errors.messages[:password][0]).to eq("can't be blank")
    end
  end

  context '同じaccountの場合' do
    user = User.create({
      email: 'test@example.com',
      account: 'account',
      password: 'aaaaaa'
    })

    user2 = User.create({
      email: 'test@example.com',
      account: 'account',
      password: 'bbbbbb'
    })

    it 'ユーザー登録できない' do 
      expect(user2.errors.messages[:account][0]).to eq("has already been taken")
    end
  end
end
