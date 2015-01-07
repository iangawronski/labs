require 'pry'

alphabet = { "a" => "alpha", "b" => "beta", "c" => "charlie", "d" => "delta", "e" => "echo", "f" => "foxtrot", "g" => "golf", "h" => "hotel", "i" => "india", "j" => "juliett", "k" => "kilo", "l" => "lima", "m" => "mike", "n" => "november", "o" => "oscar", "p" => "papa", "q" => "quebec", "r" => "romeo", "s" => "sierra", "t" => "tango", "u" => "uniform", "v" => "victor", "w" => "whiskey", "x" => "xray", "y" => "yankee", "z" => "zulu" }

# puts alphabet.keys.inspect
# puts alphabet.values.inspect
=begin
msg.each do |c|
	puts alphabet[c]
end
=end
puts "Do you want to encode or decode? E for encode, D for decode"
option = gets.chomp!

def encode(message, alphabet)
  message.each {|t| print alphabet[t], " "}
end

def decode(message, alphabet)
  message.each {|t| print alphabet.invert[t], " "}
end

msg = gets.chomp.downcase.chars

if option == "E" || option == "e"
	encode(msg, alphabet)
elsif option == "D" || option == "d"
	decode(msg, alphabet)
end


