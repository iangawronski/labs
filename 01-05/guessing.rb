number = rand(100)

puts "I'm thinking of a number from 1 to 100"
puts "What's your guess?"
guess = gets.chomp.to_i
# has to be converted to integer from a string
counter = 1

while guess != number
	if guess > number
		puts "Your guess was too high, please guess again"
		guess = gets.chomp.to_i
	else
		puts "Your guess was too low, guess again"
		guess = gets.chomp.to_i
	end
end
puts "Congrats you guessed correctly!"
