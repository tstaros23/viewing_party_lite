require 'rails_helper'

RSpec.describe 'registration page' do
  it "has a form to create a new user" do
    visit '/register'

    fill_in :name, with: "Stephanie"
    fill_in :email, with: "steph23@hotmail.com"
    fill_in :password, with: "test123"
    fill_in :password_confirmation, with: "test123"

    click_on('Create New User')

    user = User.last
    expect(user.email).to eq("steph23@hotmail.com")
    expect(user.name).to eq("Stephanie")
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Stephanie")
  end
  it "wont create a new user if passwords don't match" do
    visit '/register'

    fill_in :name, with: "Stephanie"
    fill_in :email, with: "steph23@hotmail.com"
    fill_in :password, with: "test123"
    fill_in :password_confirmation, with: "test124"

    click_on('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content('Password and Password confirmation must match')
  end

#   As a visitor
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`
end
