require 'rails_helper'

RSpec.feature "Vendors", type: :feature do
  scenario "Vendor login" do
    vendor = FactoryBot.create(:user , 
    password:"12345678",
    role:"vendor"
  )
    visit "/users/sign_in"

    fill_in "帳號" , with: vendor.username
    fill_in "密碼" , with: "12345678"

    click_button "登入"
    expect(page).to have_text("登入成功")
    expect(page).not_to have_text("我的")
  end
end
