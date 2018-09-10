require 'user'

describe User do
  describe '.sign_up' do
    it 'allows a user to sign up' do
      new_user = User.sign_up(name: 'XX', handle: 'XX', email: 'XX', password: 'XX')
      expect(User.all.first.name).to eq('XX')
      expect(User.all.first.handle).to eq('XX')
      expect(User.all.first.email).to eq('XX')
    end
  end

  describe '.all' do
    it 'returns info for all users' do
      User.sign_up(name: 'XX', handle: 'XX', email: 'XX', password: 'XX')
      expect(User.all.first.name).to eq('XX')
      expect(User.all.first.handle).to eq('XX')
      expect(User.all.first.email).to eq('XX')
    end
  end
end
