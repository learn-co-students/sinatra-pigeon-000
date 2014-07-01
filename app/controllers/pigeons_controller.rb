class PigeonsController < ApplicationController

  #root
  get '/' do
    redirect to('/pigeons')
  end

  #index
  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  #new
  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  #show
  get '/pigeons/:id' do
    @pigeon = Pigeon.find_by(:id => params[:id])
    erb :'pigeons/show'
  end

  #create
  post '/pigeons' do
    p = Pigeon.new
    p.name = params[:name]
    p.gender = params[:gender]
    p.color = params[:color]
    p.lives = params[:lives]
    if p.save
      redirect to('/pigeons')
    else
      "Error unable to save!"
    end
  end

  #edit
  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find_by(:id => params[:id])
    erb :'pigeons/edit'
  end

  #update
  patch '/pigeons/:id/update' do
    p = Pigeon.find_by(:id => params[:id])
    p.name = params[:name]
    p.gender = params[:gender]
    p.color = params[:color]
    p.lives = params[:lives]
    if p.save
      redirect to('/pigeons')
    else
      "Error - unable to save!"
    end
  end

  #destroy
  post '/pigeons/:id/destroy' do
    p = Pigeon.find_by(:id => params[:id])
    if p.destroy
      redirect to('/pigeons')
    else
      "Error - unable to destroy!"
    end
  end
end