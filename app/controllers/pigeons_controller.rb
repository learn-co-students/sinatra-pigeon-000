class PigeonsController < ApplicationController

  get '/pigeons' do 
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

end