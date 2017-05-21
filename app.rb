require_relative 'lib/game.rb'

def print_prompt
  puts
  puts @game
  puts "> Turno de #{@game.turn.upcase}"
end

def check_winner
  winner = @game.find_winner

  if winner
    puts
    puts @game
    puts
    puts "\n>> Ganador #{winner.upcase} <<"
    puts
    exit
  end
end

@game = Game.new

puts "**** 3-en-raya 0.1 ****"
puts "Introduce tu jugada en el siguiente formato: columna,fila. Ejemplo: 1,1"
puts

loop {
  print_prompt

  input = gets.chomp
  break if input == "quit"
  next  if input.scan(/\A[1-3],[1-3]\Z/).empty?

  column, row = input.split(',').map(&:to_i)

  @game.insert_token(column-1, row-1)

  check_winner
}
