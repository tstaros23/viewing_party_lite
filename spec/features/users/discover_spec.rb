require 'rails_helper'

 RSpec.describe 'discover page' do
   it "has a button for top rated movies" do
     user = User.create!(name: "Stephanie", email: "steph123@hotmail.com")

     visit "/users/#{user.id}/discover"

     click_on('Top Rated Movies')

     expect(current_path).to eq("/users/#{user.id}/movies")
   end
   it "has a button for finding movies" do
     user = User.create!(name: "Stephanie", email: "steph123@hotmail.com")

     visit "/users/#{user.id}/discover"

     fill_in :search, with: "Red Notice"

     click_on('Find Movies')

     expect(page).to have_content("Red Notice")
     expect(current_path).to eq("/users/#{user.id}/movies")

   end
 end