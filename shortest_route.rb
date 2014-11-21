#This "city" is a 100x100 grid.
#It takes 1 mins to travel from one point to another point.
class Integer
  def factorial
    (1..self).reduce(:*) || 1
  end
end


class ShortestRoute

	attr_accessor :coordinates_array
	attr_accessor :coordinates_compare
	attr_accessor :coordinates_distances
	
	def initialize(coordinates_array, time, start_coordinates)

		@number_of_potential_routes = coordinates_array.length.factorial

		@search_state = 0
		@route_state = 0
		@past_routes_state = 0

		puts coordinates_array

		@coordinates_array = []

		@coordinates_distances = []
		@coordinates_compare = []

		coordinates_array.each do |item|
			@coordinates_array.push(item)
		end

		coordinates_array.each do |item|
			@coordinates_compare.push(item)
		end

		coordinates_array.each do |item|
			@coordinates_distances.push(item)
		end

		@coordinates_compare = coordinates_array
		@time = time
		@start_coordinates = start_coordinates

		@routes = []
		@current_route = []
		@shortest_route = nil

		if (time % 15 != 0) 
			puts "Please enter a valid time."
			return
		end

		#find_distances

	end

	def unique_routes(a)
		if a.uniq.length == a.length
		  puts "routes do not contain duplicates"
		else
		  puts "route do contain duplicates"
		end
	end

	def routes
		@routes
	end

	def number_of_routes
		@routes.length
	end

	def find_distances
		@coordinates_distances.each_with_index do |coordinates, index|

			@coordinates_distances.each_with_index do |coordinates_compare, index_compare|

				#distance between
				if (index != index_compare)
					a = coordinates[:x] - coordinates_compare[:x]
					b = coordinates[:y] - coordinates_compare[:y]
					distance = Math.sqrt((a*a) + (b*b)).floor
					@coordinates_distances[index][:distances].push({
						x: coordinates_compare[:x],
						y: coordinates_compare[:y],
						distance: distance})

				end
			end
		end
	end

	def check_exists(coordinates_compare, coordinates_array)
		@routes.each do |route|
			compare_index = route.index(coordinates_compare[@current_route.length])
			array_index = route.index(coordinates_array[@current_route.length])
				puts'it got here'
			if compare_index != nil
				swap = coordinates_compare.delete_at(compare_index)
				coordinates_compare.push(swap)
			end
			if array_index != nil
				swap = coordinates_array.delete_at(array_index)
				coordinates_array.push(swap)
			end
		end
		@current_route.push(coordinates_compare[@current_route.length])
		return [coordinates_compare, coordinates_array]
	end
	

	def do_route

		if @routes.length == 900 #@number_of_potential_routes
			return @routes
		end

		if @routes.length > 0
			coordinates_arrays =  check_exists(@coordinates_compare, @coordinates_array)
			@coordinates_compare = coordinates_arrays[0]
			@coordinates_array = coordinates_arrays[1]	
		end


		if @routes.length == 0
			@current_route.push(@coordinates_compare[@current_route.length])
		end

		if @current_route.length == @coordinates_array.length
			index = @routes.index(@current_route)
			if index == nil
				@routes.push(@current_route)
				puts @routes.length
			end
			@current_route = []
		end


		if (@routes.length % @coordinates_array.length == 0)
			@search_state += 1
		end

		if @search_state == @coordinates_array.length
												puts @current_route.length
			@search_state = 0
		end

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
	{x: 86, y: 74, distances: []},
	{x: 23, y: 76, distances: []},
	{x: 23, y: 5, distances: []},
	{x: 50, y: 30, distances: []},
	{x: 10, y: 5, distances: []},
	{x: 1, y: 3, distances: []},
	{x: 30, y: 65, distances: []},
	{x: 20, y: 20, distances: []},
	{x: 71, y: 11, distances: []},
	{x: 60, y: 33, distances: []},
]

#time in 15 minute blocks
time = 120
start_coordinates = {x: 1, y: 3}

shortest_route = ShortestRoute.new(coordinates_array, time, start_coordinates)
routes = shortest_route.find_all_routes
puts shortest_route.number_of_routes
puts shortest_route.coordinates_array
puts shortest_route.coordinates_compare
shortest_route.unique_routes(routes)


