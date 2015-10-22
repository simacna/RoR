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

# print "Enter a number:"
# first_num = gets.to_i
# print "Enter Another:"
# second_num = gets.to_i

# begin
# 	answer = first_num / second_num

# rescue #called if there's an error
# 	puts "you can't divide by zero"
# 	exit
# end

# puts "#{first_num} / #{second_num} = #{answer}"
# age = 12

# def check_age(age)
# 	#puts age unless age == 0 #raise ArgumentError
	
# 	raise ArgumentError, "Enter a positive number" unless age > 0
# end

# begin
# 	check_age(0)
# rescue ArgumentError
# 	puts "That is an impossible age"
# end

# puts "Add them #{4 + 5} \n\n"
# puts 'Add them #{4 + 5} \n\n'

# multiline_string = <<EOM
# This is a very long string that contains 
# dgaga
# like #{4+5} \n\n
# EOM

# puts multiline_string


first_name = "Derek"
last_name = "Banas"
middle_name = "justin"
full_name = "#{first_name} #{middle_name} #{last_name}"


# full_name = "#{first_name} #{middle_name} #{last_name}"
# puts full_name
# puts full_name.include?("justin")

# puts full_name.size
# puts "Vowels: " + full_name.count("aeiou").to_s
# puts "Consonants: " + full_name.count("^aeiou").to_s

# puts full_name.start_with?("Banas")
# puts "Index : " + full_name.index("Banas").to_s

# puts "\"a\".equal(\"a\a) : " + ("a".equal?"a").to_s

# puts first_name.upcase


# puts first_name.rjust(20, '.')
# puts first_name.ljust(20, '.')
# puts first_name.center(20, '.')

# puts full_name.chop
# puts full_name.chomp('as')

# puts full_name.delete('a')

# name_array = full_name.split(//)
# puts name_array

# name_array = full_name.split(/ /)
# puts name_array

# class Animal
# 	def initialize #initializer, put default values
# 		puts "Creating a new animal"
# 	end

# 	def set_name(new_name)
# 		@name = new_name
# 	end

# 	def get_name
# 		@name
# 	end

# 	def name
# 		@name
# 	end

# 	def name=(new_name)
# 		if new_name.is_a?(Numeric)
# 			puts "Name can't be a number"
# 		else
# 			@name = new_name
# 		end
# 	end
# end

# cat =  Animal.new
# cat.set_name("SINA")
# puts cat.get_name
# puts cat.name

# cat.name = "Biggie"
# puts cat.name


class Dog
	# attr_reader :name, :height, :weight #create all getter functins
	# attr_writer :name, :height, :weight #create all setter functions

	attr_accessor :name, :height, :weight #this sets both getter and setters

	def bark
		return "Generic Bark"
	end
end

class GermanShepard < Dog #inheriting from Dog class
	def bark
		return "Loud bark"
	end
end

# max = GermanShepard.new
# max.name =  "Max"

# printf "%s goes %s \n", max.name, max.bark()

require_relative "human"
require_relative "smart"

module Animal
	def make_sound
		puts "Grrr"
	end
end

class Dog
	include Animal
end

rover = Dog.new
rover.make_sound

class Scientist
	include Human
	prepend Smart #if you want functions defined in the module
	#to override a function with same name defined in this class, we use
	#prepend

	def act_smart
		return "DIFF SMART"
	end
end

einstein = Scientist.new
einstein.name = "Albert"
puts einstein.name #einstein

einstein.run
puts einstein.name + " says " + einstein.act_smart


























