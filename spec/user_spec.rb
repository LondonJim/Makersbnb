require 'user'

describe User do
  describe '.sign_up' do
    it 'allows a user to sign up' do
      new_user = User.sign_up(name: 'XX', user_name: 'XX', email: 'XX', password: 'XX')
      expect(User.all.first.name).to eq('XX')
      expect(User.all.first.user_name).to eq('XX')
      expect(User.all.first.email).to eq('XX')
    end
  end
end
