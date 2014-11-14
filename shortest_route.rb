#This "city" is a 100x100 grid.
#It takes 1 mins to travel from one point to another point.


def shortest_route(coordinates_array, time, start_coordinates)
	grid = Array.new(100){ |i| 
		i = Array.new(100){ |i|
		 i = "x"
		} 
	}

	if (time % 15 != 0) 
		puts "Please enter a valid time."
		return
	end
	coordinates_array.each_with_index do |coordinates, index|

		coordinates_array.each_with_index do |coordinates_compare, index_compare|

			#distance between
			if (index != index_compare)
				a = coordinates[:x] - coordinates_compare[:x]
				b = coordinates[:y] - coordinates_compare[:y]
				distance = Math.sqrt((a*a) + (b*b)).floor
				coordinates_array[index][:distances].merge({
					x: coordinates_compare[:x],
					y: coordinates_compare[:y],
					distance: distance})
				puts distance
			end

		end

		grid[coordinates[:x]][coordinates[:y]] = "coordinates:  #{coordinates[:x]}, #{coordinates[:y]}"
	end
	print grid

end

coordinates_array = [
	{x: 10, y: 5, distances: {}},
	{x: 1, y: 3, distances: {}},
	{x: 30, y: 65, distances: {}},
	{x: 20, y: 20, distances: {}},
	{x: 71, y: 11, distances: {}},
	{x: 60, y: 33, distances: {}},
	{x: 86, y: 74, distances: {}},
	{x: 23, y: 76, distances: {}},
	{x: 23, y: 5, distances: {}},
	{x: 50, y: 30, distances: {}}
]

#time in 15 minute blocks
time = 120 
start_coordinates = {x: 1, y: 3}

shortest_route(coordinates_array, time, start_coordinates)
