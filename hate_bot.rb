require 'sinatra'
require 'json'
require 'data_mapper'

#DataMapper.setup(:default, "postgres://localhost/hate_bot_master")
DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_COBALT'])


class HateBot
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :message, Text 


DataMapper.finalize.auto_upgrade!
end


get "/message" do 
  number = repository(:default).adapter.select('SELECT COUNT(*) FROM hate_bots;')[0]
  get_message = HateBot.get(rand(number + 1 ))
  return get_message.message.to_json
end


post "/new" do 
  @new_thing = HateBot.new
  @new_thing.message = params["message"] 
  @new_thing.save 
end

get "/" do
  '<center>Send GET request to hatebot via http://localhost/message</br> Send a POST request via http://localhost/new</center>'
end


  





