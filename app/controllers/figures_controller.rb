require 'pry'
class FiguresController < ApplicationController

  get '/' do
    redirect '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end


  post '/figures' do
    # {figure: {name: 'some name'}}
    @figure = Figure.create(name: params['figure']['name'])

    if params["landmark"]["name"]
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    if params['title']['name']
      @figure.titles << Title.create(params[:title])
    end
    binding.pry
    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
