require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before :each do
    @user = User.create(name: 'steve', email: 'steve@gmail.com', password: 'jiya1234')
    @doctor = Doctor.create(user_id: @user.id, name: 'Dr Steve', bio: 'Gynecologist' , image: 'https://tse3.mm.bing.net/th?id=OIP.IVwf85npYYUcwRp4EIhqDgHaJm&pid=Api&P=0&h=180')
  end

  context 'model validations' do
    it 'should be valid' do
      expect(@doctor).to be_valid
    end

    it 'should be invalid without no bio' do
      @doctor.bio = nil
      expect(@doctor).to_not be_valid
    end

    it 'should be invalid without no doctor name' do
      @doctor.name = nil
      expect(@doctor).to_not be_valid
    end

    it 'should be invalid without no image given' do
      @doctor.image = 'https://tse3.mm.bing.net/th?id=OIP.IVwf85npYYUcwRp4EIhqDgHaJm&pid=Api&P=0&h=180'
      expect(@doctor).to be_valid
    end  
    
  end
end
