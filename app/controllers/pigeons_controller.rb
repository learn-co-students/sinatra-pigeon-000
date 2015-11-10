# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController
  
  get '/pigeons' do
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
    @pigeon = Pigeon.create(name: params[:name], gender: params[:gender], color: params[:color], lives: params[:lives])
    redirect to('/pigeons')
  end	

  patch '/pigeons/:id' do
  	@pigeon = Pigeon.find(params[:id])
  	@pigeon.update(name: params[:name], gender: params[:gender], color: params[:color], lives: params[:lives])
    redirect to("/pigeons/#{params[:id]}")
  end

  delete '/pigeons/:id' do
  	@pigeon = Pigeon.find(params[:id])
  	@pigeon.destroy
    redirect to('/pigeons')
  end

end