require 'pairty.rb'

# Driver Program

pairty = Pairty.new
num = 0

if ARGV.length != 1
  puts "The amount of arguments you have passed is incorrect."
  puts "Usage: ruby rocker.rb /Directory/Or/Filename/Goes/Here.yml"
else
  puts ARGV[0]
  if ARGV[0] =~ /.yml$/
    while true
      puts "Running..."
      puts "Loop #{num}"
      pairty.run(ARGV[0])
      num += 1
    end
  else
    puts "Your input is wrong, bro. Try again next time."
    puts "Usage: ruby rocker.rb /Directory/Or/Filename/Goes/Here.yml" 
  end
end