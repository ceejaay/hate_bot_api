require 'sinatra'
require 'json'
require 'data_mapper'

DataMapper::setup(:default, "postgres://localhost/hate_bot_master")


class HateBot
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :message, Text 


DataMapper.finalize.auto_upgrade!
end


get "/message" do #here is the data for the api get string => http://something/something/something"  do
  erb :message 
=begin
  #message = HateBot.find(params[:id])
  message = "hello world. This is the world where we live. We can do things where there are many things to be done."
  return status 404 if message.nil?
  message.to_json
=end
end


post "/new" do #'s where we have the address to send the post request." do
  @new_thing = HateBot.new
  @new_thing.message = params["message"] 
  @new_thing.save
  return status 201

 
  #here we put the code to save the message to the DB.
end


  





