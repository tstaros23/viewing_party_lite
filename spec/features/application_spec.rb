require 'rails_helper'

RSpec.describe 'welcome page' do
  it "displays a link to the homepage" do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party')
  end

  it "can create a user" do
    visit '/'

    click_on('Create a New User')
    expect(current_path).to eq('/register')
  end

  xit "lists existing users email addresses and links to their dashboard" do
    user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: "Ted", email: "tstaros23@hotmail.com",  password: 'test123', password_confirmation: 'test123')

    visit '/'

    expect(page).to have_link("tstaros23@hotmail.com")
    expect(page).to have_link("steph123@hotmail.com")

    click_on("tstaros23@hotmail.com")

    expect(current_path).to eq("/users/#{user2.id}")
  end

  it "a logged in user sees logout link" do
    user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )

    visit '/login'

    fill_in :email, with: "steph123@hotmail.com"
    fill_in :password, with: "test123"

    click_button 'Log In'

    visit '/'

    expect(page).to have_link "Log Out"
    expect(page).to_not have_link "Log In"
    expect(page).to_not have_button "Create a New User"
    click_link "Log Out"

    expect(current_path).to eq('/')

    expect(page).to have_link "Log In"
    expect(page).to have_button "Create a New User"
    expect(page).to_not have_link "Log Out"
  end

  it "a user sees links to create a account and login" do
    visit '/'

    expect(page).to have_link "Log In"
    expect(page).to have_button "Create a New User"
    expect(page).to_not have_link "Log Out"
  end

  it "a visitor does not see existing users" do
    user2 = User.create!(name: "Ted", email: "ted123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )
    user3 = User.create!(name: "Chaz", email: "chaz123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )
    visit '/'

    expect(page).to_not have_content("Existing Users")
    expect(page).to_not have_content(user2.name)
    expect(page).to_not have_content(user3.name)
  end

  it "a registered user can see existing users email addresses" do
    user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )
    user2 = User.create!(name: "Ted", email: "ted123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )
    user3 = User.create!(name: "Chaz", email: "chaz123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )

    visit '/login'

    fill_in :email, with: "steph123@hotmail.com"
    fill_in :password, with: "test123"

    click_button 'Log In'

    visit '/'

    expect(page).to have_content("Existing Users")
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.email)
  end
end
