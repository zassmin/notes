get '/' do
  @notes = Note.all

  erb :index
end

get '/note/show/:id' do 
  @note = Note.find(params[:id])

  erb :note_show
end

get '/new' do
  erb :new
end

post '/new' do 
  @note = Note.create(params[:note])
  if @note.valid?
    redirect '/'
  else
    flash[:notify] = "invalid!"
  end
end

get '/edit/:id' do
  @note = Note.find(params[:id])
  erb :edit
end

put '/update/:id' do 
  @note = Note.find(params[:id])
  @note.update_attributes(params[:note])
  if @note.valid? 
    redirect '/'
  else
    "raise errors"
  end
end  

delete '/delete/:id' do
  @note = Note.find(params[:id])
  @note.delete
  redirect '/'
end