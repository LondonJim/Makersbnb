require 'user'

describe User do
  describe '.sign_up' do
    it 'allows a user to sign up' do
      sign_up_user
      expect(User.all.first.name).to eq('XX')
      expect(User.all.first.handle).to eq('XX')
      expect(User.all.first.email).to eq('XX')
    end
  end

  describe '.all' do
    it 'returns info for all users' do
      sign_up_user
      expect(User.all.first.name).to eq('XX')
      expect(User.all.first.handle).to eq('XX')
      expect(User.all.first.email).to eq('XX')
    end
  end

  describe '.password_check' do
    it 'returns true if password is correct' do
      sign_up_user
      expect(User.password_check('XX', 'XX')).to be(true)
    end

    it 'returns false if password is not correct' do
      sign_up_user
      expect(User.password_check('XX', 'YY')).to be(false)
    end
  end
end
