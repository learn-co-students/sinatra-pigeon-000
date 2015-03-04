# Sinatra Pigeon Review

## README

- Look at 'db/seeds.rb' for table structure hints
- Write migrations for the pigeons
- Run 'rake db:migrate', 'rake db:seed'
- Write out the model for `Pigeon`
- Write out the views
- Write paths and views for all the pigeons

## RSpec

### Pigeons Setup

- On the first run through, it won't pass, because migrations still have to be written. Look at the seeds for the structure. This is the code for the first migration:

```ruby
# db/migrate/01_create_pigeons.rb

class CreatePigeons < ActiveRecord::Migration
  def change
    create_table :pigeons do |t|
      t.string :name
      t.string :color
      t.string :lives
      t.string :gender
    end
  end
end
```

- The next error says something about `uninitialized constant Pigeon`. So the next step is to create the model for Pigeon, and have it inherit from `ActiveRecord::Base`.

```ruby
# models/pigeon.rb
class Pigeon < ActiveRecord::Base
end
```

### Pigeons Index

- Then we run into an error about this: `renders the pigeon index template (FAILED - 1)`. So we need to be able to render the index template for the pigeons.

```ruby
# controller/pigeons_controller.rb

get '/pigeons' do
  @pigeons = Pigeon.all
  erb :"pigeons/index"
end
```

- The next error we run to has to do with render the data for all of the pigeons in a table on the `index.erb` template. Let's go ahead and do this below:

```ruby
# views/pigeons/index.erb

  <h1>Pigeons</h1>

  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Gender</th>
        <th>Color</th>
        <th>Lives</th>
      </tr>
    </thead>
    <tbody>
    <% @pigeons.each do |pigeon| %>
      <tr>
        <td><%= pigeon.name %></td>
        <td><%= pigeon.gender %></td>
        <td><%= pigeon.color %></td>
        <td><%= pigeon.lives %></td>
      </tr>
    <% end %>
    </tbody>
  </table>
```

### Pigeons Show

- Then we get this error: `responds with a 200 status code (FAILED - 1)` for `GET '/pigeons/:id'`. This requires there to be a controller action for this route in the `PigeonsController`. Let's set that up:

```ruby
#controllers/pigeons_controller.rb

get '/pigeons/:id' do
  @pigeon = Pigeon.find(params[:id])
  erb :"pigeons/show"
end
```

- The next error is expecting the name of the pigeon to show up on the `show.erb` template for the `GET '/pigeons/:id'` action. Let's flesh out the show template:

```ruby
# views/pigeons/show.erb
  <h1><%= @pigeon.name %></h1>

  <ul>
    <li>Name: <%= @pigeon.name %></li>
    <li>Gender: <%= @pigeon.gender %></li>
    <li>Color: <%= @pigeon.color %></li>
    <li>Lives: <%= @pigeon.lives %></li>
  </ul>
```

### Pigeons Edit

- The next error is `responds with a 200 status code (FAILED - 1)` for the `GET '/pigeons/:id/edit` action. We need to create a controller action for the edit action, and render the edit template.

```ruby
# controllers/pigeons_controller.rb

get '/pigeons/:id/edit' do
  @pigeon = Pigeon.find(params[:id])
  erb :"pigeons/edit"
end
```

- Then we have to actually fill in the `edit.erb` template so that it will render a form for changing the pigeon attributes themselves. Let's flesh that out below.

```ruby
# views/pigeons/edit.erb

<form action="/pigeons/<%= @pigeon.id %>" method="POST">
  <input type="hidden" name="_method" method="patch">

  <label for="pigeon-name">Name</label>
  <input type="text" name="pigeon[name]" value="<%= @pigeon.name %>" />
  <label for="pigeon-gender">Gender</label>
  <input type="text" name="pigeon[gender]" value="<%= @pigeon.gender %>" />
  <label for="pigeon-color">Color</label>
  <input type="text" name="pigeon[gender]" value="<%= @pigeon.color %>" />
  <label for="pigeon-lives">Hometown</label>
  <input type="text" name="pigeon[lives]" value="<%= @pigeon.lives %>" />

  <input type="submit">
</form>
```

### Pigeons New

- The next failure we see is this: `responds with a 200 status code (FAILED - 1)` for the `GET '/pigeons/new'` action. Let's flesh out the controller action here:

```ruby
# controllers/pigeons_controller.rb

get '/pigeons/new' do
  erb :"pigeons/new"
end
```

- THe next test is looking for a form element inside of the `new.erb` template, so let's create that form:

```ruby
# views/pigeons/new.erb

<form action="/pigeons" method="POST">
  <label for="pigeon-name">Name</label>
  <input type="text" name="pigeon[name]" />
  <label for="pigeon-gender">Gender</label>
  <input type="text" name="pigeon[gender]" />
  <label for="pigeon-color">Color</label>
  <input type="text" name="pigeon[gender]" />
  <label for="pigeon-lives">Hometown</label>
  <input type="text" name="pigeon[lives]" />

  <input type="submit">
</form>
```

- Then let's set up a controller action to handle the post request that will come from this form.

```ruby
# controllers/pigeons_controller.rb

post '/pigeons' do
  @pigeon = Pigeon.new(params[:pigeon])
  @pigeon.save
  redirect "/pigeons/#{@pigeon.id}"
end
```

### Pigeons Destroy

- The next thing is that we get this error: `redirects to the pigeons index page (FAILED - 1)` for `POST '/pigeons/:id/destroy'`. Let's write out that code in the PigeonsController:

```ruby
post '/pigeons/:id/destroy' do
  @pigeon = Pigeon.find(params[:id])
  @pigeon.destroy
  redirect "/pigeons"
end
```

### Pigeons Update

- The final test is to fix the patch method for `edit`:

```ruby
# views/pigeons/edit.erb
<form action="/pigeons/<%= @pigeon.id %>/update" method="POST">
  <input type="hidden" name="_method" method="patch">

  <label for="pigeon-name">Name</label>
  <input type="text" name="name" value="<%= @pigeon.name %>" />
  <label for="pigeon-gender">Gender</label>
  <input type="text" name="gender" value="<%= @pigeon.gender %>" />
  <label for="pigeon-color">Color</label>
  <input type="text" name="color" value="<%= @pigeon.color %>" />
  <label for="pigeon-lives">Hometown</label>
  <input type="text" name="lives" value="<%= @pigeon.lives %>" />

  <input type="submit">
</form>
```

Then let's add the controller action:

```ruby
patch '/pigeons/:id/update' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.name = params["name"]
    @pigeon.color = params["color"]
    @pigeon.gender = params["gender"]
    @pigeon.lives = params["lives"]
    @pigeon.save

    redirect "/pigeons"
  end
```
