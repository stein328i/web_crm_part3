require_relative 'contact'

require 'sinatra'



get '/' do
  redirect to ('/contacts')
end


get '/contacts' do
  @index_link = 'http://localhost:4567/'
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end


after do
  ActiveRecord::Base.connection.close
end
