class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Figure.all
    # binding.pry
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # binding.pry
    erb :'/landmarks/show'
  end

  get '/landmarks/:landmark_id' do
    @landmark = Landmark.find(params[:landmark_id])
    # binding.pry
    erb :'/landmarks/show'
  end

  get '/landmarks/:landmark_id/edit' do
    @landmark = Landmark.find(params[:landmark_id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:landmark_id' do
    @landmark = Landmark.find(params[:landmark_id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
