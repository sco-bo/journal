require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe Post do 

    before :all do 
      @post = FactoryGirl.create(:post)
      @body = 'Hello, world'
      @post2 = FactoryGirl.create(:post, body: @body, private: true)
    end

    it "has a valid factory" do 
      expect(@post).to be_valid
    end

    it { should belong_to :user }

    it "is encrypted" do 
      expect(@post2.body).not_to eq(@body)
    end

    it "can be decryped" do 
      expect(@post2.decrypt).to eq(@body)
    end
    
    it "is invalid if not public or private" do
      @post.private = '' 
      expect(@post).to_not be_valid
    end
  end
end
