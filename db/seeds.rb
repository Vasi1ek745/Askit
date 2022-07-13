
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times { Question.create(title: Faker::Movie.title ,body: Faker::Quote.famous_last_words) }

Question.all.each do |question|
    10.times { question.answers.create body:Faker::TvShows::Simpsons.character}
end