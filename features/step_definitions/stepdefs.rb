require_relative '../../app/lib/rover_runner.rb'

Given("a Plateau of size {int}, {int}") do |x, y|
  @plateau = "#{x} #{y}"
  filename = 'input.txt'
  @input_file = File.open 'input.txt', 'w'
  @input_file.puts @plateau
end

Given("a Rover is at {int}, {int} and pointed {string}") do |x, y, direction|
  @rover = "#{x} #{y} #{direction}"
  @input_file.puts @rover
end

Given("the Rover is commanded with {string}") do |commands|
  @commands = commands
  @input_file.puts @commands
end

Then("the Rover should be at {int}, {int}, and pointed {string}") do |x, y, direction|
  # Here will be the actual "thunk" that causes the above constructed data to
  # be used to do the computation.

  # Cache results
  @results ||={}
  key = [@plateau, @rover, @commands]
  result = `bin/brovers`
  @results[key] = result

  #expect(result.include? "#{x} #{y} #{direction}").to be(true)
  puts "Pending!!!"
  puts "(still running it as I want to see the result)"
  puts "result: #{ result }"
end
