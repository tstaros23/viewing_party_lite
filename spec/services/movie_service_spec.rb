require 'rails_helper'

RSpec.describe MovieService do

  it "can find popular movies" do
<<<<<<< HEAD
  expect(MovieService.popular_movies).to eq(Hash)
=======

  expect(MovieService.popular_movies).to be_a(Array)

>>>>>>> b16798612d765e359df7ca519219c85d77896b2a
  end
end
