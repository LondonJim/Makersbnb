require 'user'

describe User do

  describe '.login' do
    before(:each) do
      User.create(name: 'XX', handle: 'XX', email: 'XX', password: 'XX')
    end
    it 'allows a user to login with correct details' do
      expect(User.login(handle: 'XX', password: 'XX')).to be true
    end

    it 'doesn\'t allow you to login with incorrect details' do
      expect(User.login(handle: 'XX', password: 'YY')).to be false
    end
  end
end
