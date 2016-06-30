require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe User do 

    describe "user validation" do 
      before :all do 
        @user = FactoryGirl.create(:user)
      end

      it "has a valid factory" do 
        expect(@user).to be_valid
      end

      it "is invalid without a username" do 
        @user.username = ''
        expect(@user).to_not be_valid
      end

      it "is invalid without an email" do 
        @user.email = ''
        expect(@user).to_not be_valid
      end

      it { should validate_uniqueness_of :username }
    end
  end
end