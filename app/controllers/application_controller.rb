require './config/environment'
require './app/models/sample_model'
require 'httparty'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  
  get '/' do
        
    
    return erb :index
  end
  get '/two' do
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @two_line = two_line
    @two = return_train_line(@all_stations, @two_line, "2-all times", "2-nights", "")
    @two_length = @two[0].length
    return erb :two
  end
  get '/one' do
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @one_line = one_line
    @one = return_train_line(@all_stations, @one_line, "1-all times", "1-nights", "")
    @one_length = @one[0].length 
    return erb :one
  end
  
  
  
  
  get '/Q' do 
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @q_line = q_line
    @q = return_train_line(@all_stations, @q_line, "Q-all times", "Q-nights", "-nights")
    @q_length = @q[0].length
    return erb :Q
  end
  
  get '/four' do
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @four_line = four_line
    @four = return_train_line(@all_stations, @four_line, "4-all times", "4-nights", "-nights")
    @four_length = @four[0].length 
    return erb :four 
  end 
  
  get '/five' do 
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @five_line = five_line
    @five = return_train_line(@all_stations, @five_line, "5-all times", "5 weekdays", " -weekdays")
    @five_length = @five[0].length 
    
    return erb :five 
    
    
    
    
    
  end 
  get '/six' do
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @six_line = six_line 
    @six = return_train_line(@all_stations, @six_line, "6-all times", "6-all other times", "")
    @six_length = @six[0].length 
    
    return erb :six
  end
    
  get '/map' do
    return erb :map
  end
  
  # get '/search' do
  #   return erb :search
  # end
  
  # post '/search' do
  #   puts params["input"]
  #   @dest = params["input"]
  #   return erb @dest.to_sym
  # end

  # get '/test' do
  #   return erb :test
  # end
end