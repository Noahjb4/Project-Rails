    # puts subway_dataset["data"][1][10]
    # puts subway_dataset["data"][1][13]
require 'httparty'  

##Blank array which data will be stored in##
def six_line
    six = [ 
        six_all_times = [],
        
        
        six_nights = []
        
        ]
    return six 
end

def q_line
    q= [
        q_all_times = [],
        
        q_nights = [ ] 
        
        ]
    return q
end 
 
 
 
 
 #### Creates a class system for each subway station  
class            Subway_station 
        attr_accessor :name , :lines  
        def initialize(name, lines)
            @name = name
            @lines = lines 
        end
        def output_stations
            puts "#{@name} ---- #{@lines}"
        end
    end             
    
    
    
    #====================================================           Gets Subway + Lines      ==============================================================
def get_subway_dataset    
    subway_dataset = HTTParty.get('https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.json?accessType=DOWNLOAD')
    return subway_dataset
end

    
    
    
    
    
       
    
    
    
#the data set for the entire six line is now called 'six'    


 
#sets each of the first 200 subway stations into a subway station class   
def get_all_stations(subway_dataset)  
    all_station = [] 
    for x in 0..472
        new_station = Subway_station.new(subway_dataset["data"][x][10], subway_dataset["data"][x][13])
        all_station.push(new_station) 
    end
    return all_station
end



#functionn to fill the six line array called line and returns the new array  
def return_train_line(all_stations, line, line_cat_1, line_cat_2, category)
    for x in 0..472
        if all_stations[x].lines.include?(line_cat_1)
            line[0].push(all_stations[x])
            all_stations[x].output_stations
        elsif all_stations[x].lines.include?(line_cat_2)
            line[0].push(all_stations[x])  
        end
    end
    return line
end 


#Im working on that rn



