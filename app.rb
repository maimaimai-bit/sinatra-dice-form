require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:dice_form)
end

get("/process_roll") do
  # Get the number of dice and sides from query params
  @dice = params.fetch("dice").to_i
  @sides = params.fetch("sides").to_i
  
  # Generate random rolls
  @rolls = []
  @dice.times do
    @rolls.push(rand(1..@sides))
  end

  erb(:roll_result)
end
