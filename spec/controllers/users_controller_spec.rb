require 'spec_helper'

describe UsersController do
  render_views


  describe "GET 'show'" do
  
    # use the factories.rb file to create a factory user  
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do 
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the correct user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the correct title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end
    
    it "should include the users's name" do
      get :show, :id =>@user
      response.should have_selector("h1", :content => @user.name)
    end
    
    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
      
  end
  

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    
    it "returns the correct title" do
      get 'new'
      response.should have_selector('title', :content=>"Sign up")
    end
  end
  
  

end