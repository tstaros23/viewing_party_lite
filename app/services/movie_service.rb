class MovieService
  def self.popular_movies

<<<<<<< HEAD
    response = conn.get("/movie/popular?api_key=d36e20441bd82022b81b976673b2a800&language=en-US&page=1")
      require "pry"; binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
    #require "pry"; binding.pry
    @movies = json[:results]


=======
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("3/movie/popular?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    json = JSON.parse(response.body, symbolize_names: true)
>>>>>>> b16798612d765e359df7ca519219c85d77896b2a

    @movies = json[:results]
  end
end
