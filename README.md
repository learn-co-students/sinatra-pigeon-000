# Sinatra Pigeon

## Objectives

Create a Sinatra app that lists all pigeons, can create new ones, shows individual pigeons and their characteristics on their own, edits a pigeon, and deletes one pigeon at time.

## Instructions

* Fork this repo.
* Clone your fork and cd into the newly created directory.
* From terminal run `bundle install`.
* To view a list of available rake tasks, run `rake -T`.
* Write your migration for pigeons. Take a look at `db/seeds.rb` for table's structure hints.
* Run `rake db:migrate` to migrate the pigeon table.
* In `app/models/pigeons.rb`, write your pigeon model.
* Run `rake db:seed` to load the information in the seed file into your database.
* Flesh out the `app/controllers/pigeons_controller.rb` and views to fulfill the requirements below. Remember to make use of the appropriate RESTful paths to create, read, update, and destroy pigeons.

## Requirements
* Include the following paths:
  * GET /pigeons
  * POST /pigeons
  * GET /pigeons/new
  * GET /pigeons/:id
  * GET /pigeons/:id/edit
  * PATCH /pigeons/:id - remember to add `use Rack::MethodOverride` to the `config.ru` file for patch requests
  * DELETE /pigeons/:id
* These routes will map to the appropriate views  `app/views/pigeon`:
  * index.erb
  * new.erb
  * show.erb
  * edit.erb
* Fill in these views with the appropriate ERB code and HTML to match the example solution at:
  * [http://flatironschool-sinatra-pigeons.herokuapp.com](http://flatironschool-sinatra-pigeons.herokuapp.com).
  * Hint: note when creating your forms that most browsers don’t support methods other than GET and POST. When creating the form for PATCH and DELETE, you'll want to use the `_method` hack to make POST requests look like other request methods (e.g. PATCH, DELETE). For an example of the necessary hidden input, visit [this stackoverflow page](http://stackoverflow.com/questions/7005629/how-to-create-a-delete-form-with-restful-routes-in-rails)
* Run `shotgun` in terminal to test out the web app at [localhost:9393/](http://localhost:9393/).
* Run `rake db:migrate SINATRA_ENV=test` before running `rspec`.

## Resources
* [Heroku](http://www.heroku.com/) - [Pigeon App](http://flatironschool-sinatra-pigeons.herokuapp.com)
