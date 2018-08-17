require "httparty"
subway_dataset = HTTParty.get('https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.json?accessType=DOWNLOAD')
# puts subway_dataset["data"][1][10]
# puts subway_dataset["data"][1][13]





def six_line
    six = [ 
        six_all_times = [],
    
    
         six_nights = [ ]
    
        ]
    return six 
end



#====================================================           Gets Subway + Lines      ==============================================================
class Subway_station 
    attr_accessor :name , :lines ,:station_line
    def initialize(name, lines)
        @name = name
        @lines = lines 
    end
    def output_stations
        puts "#{@name} ---- #{@lines}"
    end
end             












six = six_line
all_stations = [] 

for x in 0..200
    new_station = Subway_station.new(subway_dataset["data"][x][10], subway_dataset["data"][x][13])
    all_stations.push(new_station) 

end

for x in 0..200
    if all_stations[x].lines.include?(" 6-all times")
        six[0].push(all_stations[x])
    elsif all_stations[x].lines.include?("6 nights")
        six[1].push(all_stations[x])  
    end
end

    








