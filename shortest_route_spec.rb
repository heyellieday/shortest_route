require 'shortest_route.rb'

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times { bowling.hit(0) }
    bowling.score.should eq(0)
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