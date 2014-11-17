#This "city" is a 100x100 grid.
#It takes 1 mins to travel from one point to another point.


class ShortestRoute
	
	def initialize(coordinates_array, time, start_coordinates)
		@@search_state = 0
		@@route_state = 0
		@@past_routes_state = 0

		@@coordinates_array = coordinates_array
		@time = time
		@start_coordinates = start_coordinates

		@@routes = []
		@@current_route = []
		@@shortest_route = nil

		if (time % 15 != 0) 
			puts "Please enter a valid time."
			return
		end

		find_distances

	end

	def coordinates_array
		return @@coordinates_array
	end

	def routes
		@@routes
	end

	def find_distances
		@@coordinates_array.each_with_index do |coordinates, index|

			@@coordinates_array.each_with_index do |coordinates_compare, index_compare|

				#distance between
				if (index != index_compare)
					a = coordinates[:x] - coordinates_compare[:x]
					b = coordinates[:y] - coordinates_compare[:y]
					distance = Math.sqrt((a*a) + (b*b)).floor
					@@coordinates_array[index][:distances].push({
						x: coordinates_compare[:x],
						y: coordinates_compare[:y],
						distance: distance})

				end
			end
		end
	end
	

	def do_route
		if @@route_state == 8
			@@routes.push(@@current_route)
			@@current_route = []
			@@route_state = 0
		end
		if @@search_state == 8
			return @@routes
		end

		if @@routes.length > 0
			 #puts @@coordinates_array[@@search_state][:distances][@@route_state]
			index = @@routes[@@search_state].index(@@coordinates_array[@@search_state][:distances][@@route_state])
			puts index
			swap = @@coordinates_array[@@search_state][:distances].delete_at(index)
			puts swap
			@@coordinates_array[@@search_state][:distances].push(swap)
		end

		@@current_route.push(@@coordinates_array[@@search_state][:distances][@@route_state])
		@@route_state  += 1
		do_route


	end

	def find_all_routes
		routes = do_route
		return routes
	end

	def determine_shortest_route

	end
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

shortest_route = ShortestRoute.new(coordinates_array, time, start_coordinates)
routes = shortest_route.find_all_routes
print shortest_route.routes


