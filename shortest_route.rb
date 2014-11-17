#This "city" is a 100x100 grid.
#It takes 1 mins to travel from one point to another point.
class Integer
  def factorial
    (1..self).reduce(:*) || 1
  end
end


class ShortestRoute
	
	def initialize(coordinates_array, time, start_coordinates)

		@@number_of_routes = coordinates_array.length.factorial

		@@search_state = 0
		@@route_state = 0
		@@past_routes_state = 0

		@@coordinates_array = coordinates_array
		@@coordinates_compare = coordinates_array
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

	def unique_routes(a)
		if a.uniq.length == a.length
		  puts "a does not contain duplicates"
		else
		  puts "a does contain duplicates"
		end
	end

	def routes
		@@routes
	end

	def number_of_routes
		print @@routes.length
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

		if @@routes.length == 100
			return @@routes
		end
		if @@routes.length > 0
			index = @@routes[@@search_state].index(@@coordinates_compare[@@route_state])
			if index != nil
				swap = @@coordinates_array.delete_at(index)
				@@coordinates_array.push(swap)
			end
		end

		if @@route_state == @@coordinates_array.length
			index = @@routes.index(@@current_route)
			if index != nil
				@@current_route = []
				@@route_state = 0
				@@search_state += 1
			else
				@@routes.push(@@current_route)
				@@current_route = []
				@@route_state = 0
			end

			@@current_route = []
			@@route_state = 0
		end
		if @@search_state == @@coordinates_array.length
			@@routes.length
			@@search_state = 0
		end
		puts @@search_state
		@@current_route.push(@@coordinates_compare[@@route_state])
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
	{x: 60, y: 33, distances: [], visited: false},
]

#time in 15 minute blocks
time = 120
start_coordinates = {x: 1, y: 3}

shortest_route = ShortestRoute.new(coordinates_array, time, start_coordinates)
routes = shortest_route.find_all_routes
shortest_route.unique_routes(shortest_route.routes)
shortest_route.number_of_routes


