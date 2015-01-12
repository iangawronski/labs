require 'set'
words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']

def finished? (turns, guesses, answer)
  turns.zero? || complete_word?(answer, guesses)
end

def greeting
  puts `clear`
  puts 'Welcome to the game of Hangman! Lets get started'
end

def game_over (x, y)
  if complete_word?(x, y)
    puts 'Yup, you got it, congrats!'
  else
    puts "Dude, come on, the answer is #{x}"
  end
end

def complete_word? (word, letters)
  word.chars.all? { |x| letters.include?(x) }
end

def prompt_player
  puts 'Please pick a single letter from A to Z'
  gets.chomp
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting
  until finished?(turn_count, guessed, answer)
    guess = prompt_player
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(answer, guessed)
end

hangman(words)
