# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController

	get '/pigeons' do
		@pigeons = Pigeon.all
		erb :'pigeons/index'
	end

	get '/pigeons/:id/edit' do
		@pigeon = Pigeon.find_by(id: (params[:id]))
		erb :'pigeons/edit'
	end

  get '/pigeons/new' do
  	erb :'pigeons/new'
  end

	get '/pigeons/:id' do
		@pigeon = Pigeon.find_by(id: (params[:id]))
		erb :'pigeons/show'
	end

	post '/pigeons' do
		pigeon = Pigeon.new(name: (params[:name]), gender: (params[:gender]), color: (params[:color]), lives: (params[:lives]))
		pigeon.save
		redirect '/pigeons'
	end

	delete "/pigeons/:id" do
		pigeon = Pigeon.find_by(id: (params[:id]))
		pigeon.destroy
		redirect '/pigeons'
	end

	patch "/pigeons/:id" do
		pigeon = Pigeon.find_by(id: (params[:id]))
		pigeon.name = params[:name]
		pigeon.color = params[:color]
		pigeon.gender = params[:gender]
		pigeon.lives = params[:lives]
		pigeon.save
		redirect "/pigeons/#{params[:id]}"
	end

end