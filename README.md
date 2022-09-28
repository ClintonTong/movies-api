in terminal: 

git clone this git repo
bundle install
rake db:create
rake db:migrate
rails s


to test please use postman to do any of the following requests

url = http://localhost:3000

GET    
path = /api/v1/movies                                                                                    get some movies
params = {search: "search term"}

POST   
path = /api/v1/movies/create                                                                             create movie
or
path = /api/v1/movies/update                                                                             update movie data

params = {title: "movie test", description: "cool scary movie", releaseyear: 2022, duration: 100}

POST
path = /api/v1/movies/update_rating.                                                                     update_rating
params = {id: 1, liked: true}


DELETE 
path = /api/v1/movies/:id                                                                                delete a movie 
