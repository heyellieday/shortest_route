#This "city" is a 100x100 grid.
#It takes 1 mins to travel from one point to another point.


def shortest_route(coordinates_array, time, start_coordinates)
	grid = Array.new(100){ |i| 
		i = Array.new(100){ |i|
		 i = "x"
		} 
	}
	shortest_routes = []

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
				coordinates_array[index][:distances].push({
					x: coordinates_compare[:x],
					y: coordinates_compare[:y],
					distance: distance,
					visited: false})
					puts distance

			end

		end

		grid[coordinates[:x]][coordinates[:y]] = "coordinates:  #{coordinates[:x]}, #{coordinates[:y]}"
	end
	coordinates_array.each_with_index do |coordinates, index|
		if (coordinates_array[index][:visited] == false )
			coordinates_array.each_with_index do |coordinates_compare, index_compare|
				if (coordinates_array[index_compare][:visited] == false )
				#shortest routes
					if (index != index_compare)
						shortest_distance = nil
						coordinates_array[index][:distances].each_with_index do |distance, index_distance|
							if shortest_distance == nil
								shortest_distance = 1000
							end
							if (shortest_distance >= distance[:distance] && distance[:visited] == false )
								shortest_distance = distance[:distance]
								coordinates_array[index][:distances][index_distance][:visited] = true
								coordinates_array[index_distance][:visited] = true
								shortest_routes.push(shortest_distance)
							end
						end
					end
				end
			end
		end
	end
	print shortest_routes
end

coordinates_array = [
	{x: 86, y: 74, distances: [], visited: false},
	{x: 23, y: 76, distances: [], visited: false},
	{x: 23, y: 5, distances: [], visited: false},
	{x: 50, y: 30, distances: [], visited: false},
	{x: 10, y: 5, distances: [], visited: false },
	{x: 1, y: 3, distances: [], visited: false},
	{x: 30, y: 65, distances: [], visited: false},
	{x: 20, y: 20, distances: [], visited: false},
	{x: 71, y: 11, distances: [], visited: false},
	{x: 60, y: 33, distances: [], visited: false}
]

#time in 15 minute blocks
time = 120 
start_coordinates = {x: 1, y: 3}

shortest_route(coordinates_array, time, start_coordinates)
