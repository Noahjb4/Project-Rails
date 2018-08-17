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
  get '/Q' do 
    @subway_dataset = get_subway_dataset
    @all_stations = get_all_stations(@subway_dataset)
    @q_line = q_line
    @q = return_train_line(@all_stations, @q_line, "Q-all times", "Q-nights", "-nights")
    @q_length = @q[0].length
    
    return erb :Q
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
  

end