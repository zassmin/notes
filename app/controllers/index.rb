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

get '/edit/:id' do |id|
  @note = Note.find(params[:id])
  # form will look like creating a note expect button will be saving form
  erb :edit
end

put '/update/:id' do 
  @note = Note.find(params[:id])
  @note.update_attributes(params[:note])
  if @note.valid? # don't know if validations work on update so will check
    redirect '/'
  else
    "raise errors"
  end
end  

delete '/delete/:id' do
  @note = Note.find(params[:id])
  if @note.delete
    redirect '/'
  else
    flash[:notify] = "didn't delete!" # this flash thing just hasn't been working for me
  end
end