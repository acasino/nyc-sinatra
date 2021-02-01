class FiguresController < ApplicationController
  # add controller methods

  #GET: Index Action - index page to display all figures
  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end

  #GET: New Action - displays create figure form
  get '/figures/new' do
    erb :'figures/new'
  end

  #GET: Show Action - displays one figure based on ID in the URL
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  #GET: Edit Action - displays edit form based on ID in the URL
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  #POST: Create Action - creates one more figure
  post '/figures' do
    @figure = Figure.create(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


  #PATCH: Update Action - modifies an existing article based on ID in the URL
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  #PUT: Update Action - replaces an existing article based on ID in the URL
  ##Not used in this lab

  #DELETE: Delete Action = delte one article based on ID in URL
  ##Not used in this lab


end
