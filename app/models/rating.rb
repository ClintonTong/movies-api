class Rating < ApplicationRecord
  belongs_to :movie
  after_create :update_movie_rating

  validates :liked, inclusion: [true, false]

  def update_movie_rating
    ratings = Rating.where(movie_id: movie.id)
    return if ratings.nil?
    new_rating = (ratings.where(liked: true).count / ratings.count.to_f) * 100
    movie.update rating: new_rating
  end
end
