class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:update_rating, :update, :destroy, :show]
  
  def index
    search_term = params[:search]
    if search_term.present?
      @movies = Movie.where("title LIKE ?", "%#{search_term}%")
    end
    @movies ||= Movie.all
    render json: @movies
  end

  def update_rating
    @movie.ratings.create! ratings_params
    render json: {success: true}
  rescue Exception => e
    render json: { notice: e.message }
  end

  def show
    if @movie
      render json: @movie
    else
      render json: @movie.errors
    end
  end


  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render json: @movie.errors
    end
  end


  def update
    raise Exception.new "Movie was not found" if @movie.nil?
    @movie.update! movie_params

    render json: { notice: 'movie was successfully updated.' }

  rescue Exception => e
    render json: { notice: e.message }
  end


  def destroy
    @movie.destroy

    render json: { notice: 'movie was successfully removed.' }
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.permit(:title, :description, :releaseyear, :duration, :rating)
    end

    def ratings_params
      params.permit(:liked)
    end
end
