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
  
   describe '.sign_up' do	
    it 'allows a user to sign up' do	
      User.sign_up(
        name: 'XX', 
        handle: 'XX', 
        email: 'XX', 
        password: 'XX', 
        password_confirmation: 'XX'
        )	
      expect(User.all.first.name).to eq('XX')	
      expect(User.all.first.handle).to eq('XX')	
      expect(User.all.first.email).to eq('XX')	
    end	
     it 'does not allow the same handle to sign up again' do	
      sign_up_user	
      expect(User.sign_up(name: 'YY', handle: 'XX', email: 'YY', password: 'YY')).to be(nil)	
    end	
     it 'does not allow the same email to sign up again' do	
      sign_up_user	
      expect(User.sign_up(name: 'YY', handle: 'YY', email: 'XX', password: 'YY')).to be(nil)	
    end	
  end
end
