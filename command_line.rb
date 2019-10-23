# example of bringing things in on the command line

# printing ARGV prints all the incoming arguments
puts "All the arguments supplied to me were:"
puts ARGV

# you can also pick and choose by index which argument you want
puts "The first argument was #{ARGV[0]}"
puts "The second argument was #{ARGV[1]}"
puts "The last argument was #{ARGV[-1]}"
puts "The second to last argument was #{ARGV[-2]}"

# if you REALLY want to get fancy, you can make a hash out of the arguments. 
# this is helpful if you don't want your args to be position-dependent.
# that's a good thing, because it's one less thing to remember. 
# if you supply args like --first-name Michael --last-name Fritzius
# then you can build a hash and use that instead. 
options = {} 
ARGV.each_slice(2) { |x| options[x[0]] = x[1] }

puts options
puts "If you supplied a --first-name option it would be #{options['--first-name']}"