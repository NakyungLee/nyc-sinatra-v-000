class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # binding.pry
    if params[:title][:name]
      t = Title.create(params[:title])
      @figure.titles << t
    end
    if params[:landmark][:name]
      l = Landmark.create(params[:landmark])
      @figure.landmarks << l
    end
    erb :"/figures/show"
  end

  get '/figures/:figure_id/edit' do
    @figure = Figure.find(params[:figure_id])
    erb :'/figures/edit'
  end

  patch '/figures/:figure_id' do
    # binding.pry
    @figure = Figure.find(params[:figure_id])
    @figure.update(params[:figure])
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if params[:title][:name] != ""
      t = Title.create(params[:title])
      @figure.titles << t
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:figure_id' do
    @figure = Figure.find(params[:figure_id])
    # binding.pry
    erb :'/figures/show'
  end

end
