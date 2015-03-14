require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "postgres://localhost/hate_bot")


class HateBot
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :message, Text 


DataMapper.finalize.auto_upgrade!
end


get "/here is the data for the api get string => http://something/something/something"  do
  #it sends out json data.
end


post "/here's where we have the address to send the post request." do
  #here we put the code to save the message to the DB.
end


  





