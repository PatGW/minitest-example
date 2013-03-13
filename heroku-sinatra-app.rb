
# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser

require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'data_mapper'
require 'dm-migrations'
require './lib/bike.rb'

DataMapper.setup(:default, 'postgres://localhost/boris_bikes')
DataMapper.auto_upgrade!
DataMapper.finalize

  get '/bikes' do
    @bikes = Bike.all 
    erb :add_bike_form
  end
 
 post '/bikes' do   
    b = Bike.new     
    b.save  
    redirect '/bikes'  
  end 

  


# for templates uncomment the line below
# require 'erb'
 

# Test at <appname>.heroku.com (you'll need to create your app first!)