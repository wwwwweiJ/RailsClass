require 'rails_helper'

RSpec.describe User, type: :model do

  # before do 
  #   @user = FactoryBot.create(:user , password:"12345678")
  # end

  let(:user){FactoryBot.create(:user,password:"12345678")}

  #Arrange
  it "username不能重複" do 
    username = "kk"
    FactoryBot.create(:user , username: username)

    # User.create(
    #   email:"cc@cc",
    #   password:"123123",
    #   username:username
    # )

  #Act
  u = FactoryBot.build(:user , username: username)
  u.save
  # u = User.new(
  #   email:"aa@aa",
  #   password:"123123",
  #   username:username
  # )

  #Assertion 
  expect(u.errors.any?).to be true
  end

  it "使用者可以登入"  do 
    
    #Arrange
    # user = FactoryBot.create(:user, password:"12345678")
    #Act
    user_data = {
      account: user.username,
      password: "12345678"
    }
    result = User.login(user_data)
    
    #Assert
    expect(result.email).to eq user.email
  end

  it "註冊時密碼會加密" do
    # user = FactoryBot.create(:user, password:"12345678") 
    expect(user.password).not_to be "12345678"
  end
end
