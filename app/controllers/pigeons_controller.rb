# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController
  get '/' do
    redirect '/pigeons'
  end

  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/show'
  end

  get '/pigeons/:id/edit' do
   @pigeon = Pigeon.find(params[:id])
   erb :'pigeons/edit'
 end

 post '/pigeons' do
   Pigeon.create(:name => params["name"], :color => params["color"],
                 :gender => params["gender"], :lives => params["lives"])

   redirect '/pigeons'
 end

 #edits pigeon
 patch '/pigeons/:id' do
   @pigeon = Pigeon.find(params[:id])
   @pigeon.name = params["name"]
   @pigeon.color = params["color"]
   @pigeon.gender = params["gender"]
   @pigeon.lives = params["lives"]
   @pigeon.save

   redirect to "/pigeons/#{@pigeon.id}"
 end

 delete '/pigeons/:id' do
   pigeon = Pigeon.find(params[:id])
   pigeon.destroy

   redirect '/pigeons'
 end


end
