require 'rails_helper'

 RSpec.describe 'User Login' do
   it 'the user can log in' do
     user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )

     visit '/'

     click_link "Log In"

     expect(current_path).to eq('/login')

     fill_in :email, with: "steph123@hotmail.com"
     fill_in :password, with: "test123"

     click_button 'Log In'

     expect(current_path).to eq("/users/#{user.id}")
   end

   it 'the user cant log in with bad credentials' do
     user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )

     visit '/'

     click_link "Log In"

     expect(current_path).to eq('/login')

     fill_in :email, with: "steph123@hotmail.com"
     fill_in :password, with: "test12"

     click_button 'Log In'

     expect(current_path).to eq("/login")
     expect(page).to have_content("Bad Credentials: Try again.")
   end
   it 'the user cant log in with bad credentials' do
     user = User.create!(name: "Stephanie", email: "steph123@hotmail.com",  password: 'test123', password_confirmation: 'test123' )

     visit '/'

     click_link "Log In"

     expect(current_path).to eq('/login')

     fill_in :email, with: "stephdawg@hotmail.com"
     fill_in :password, with: "test123"

     click_button 'Log In'

     expect(current_path).to eq("/login")
     expect(page).to have_content("Bad Credentials: Try again.")
   end
 end
