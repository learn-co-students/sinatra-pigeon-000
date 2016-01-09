class PigeonsController < ApplicationController

  get '/pigeons' do

    erb :'pigeons/index'
  end

  post '/pigeons' do
    new_pigeon = Pigeon.new.tap{|t|
                    t.name = params[:name]
                    t.gender = params[:gender]
                    t.color = params[:color]
                    t.lives = params[:lives]
                  }.save

    redirect to("/pigeons")
  end

  get '/pigeons/new' do

    erb :"pigeons/new"
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find_by(id: params[:id])

    erb :"pigeons/edit"
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find_by(id: params[:id])

    erb :"pigeons/show"
  end

  delete '/pigeons/:id' do
    Pigeon.find_by(id: params[:id]).destroy

    redirect to("/pigeons")
  end

  patch '/pigeons/:id' do
    #### peep solution!!!
    p = Pigeon.find_by(id: params[:id])
    p.name = params[:name]
    p.gender = params[:gender]
    p.color = params[:color]
    p.lives = params[:lives]
    p.save
    
    redirect to("/pigeons/#{p.id}")
  end

end