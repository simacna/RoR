# a = 1

# until a >= 10
# 	a += 1
# 	next unless (a%2==0)
# 	puts a
# end

groceries = ['bananas', 'pasta', 'rice']

# groceries.each do |food|
# 	puts "Get some #{food}"
# end

# for food in groceries
# 	puts "Get some #{food}"
# end

# (0...5).each do |i|
# 	puts "##{i}"
# end

# def add_nums(num_1, num_2)
# 	return num_1.to_i + num_2.to_i
# end

# puts add_nums(3,4)

print "Enter a number:"
first_num = gets.to_i
print "Enter Another:"
second_num = gets.to_i

begin
	answer = first_num / second_num

rescue #called if there's an error
	puts "you can't divide by zero"
	exit
end

puts "#{first_num} / #{second_num} = #{answer}"





























