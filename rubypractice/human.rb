#Modules - can't instantiaze, you can't turn them into an object
#You use them to add functionality, you can only inherit one class
#but can inherit multiple modules

module Human
	attr_accessor :name, :height, :weight

	def run
		puts self.name + " runs"
	end
end