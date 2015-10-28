class Article < ActiveRecord::Base #activerecord provides lots of functionality, including basic database CRUD
	#data validation, and sophisticated search support and ability to relate models to each other
	has_many :comments, dependent: :destroy #how does it know what :comments is
	validates :title, presence: true,
					  length: { minimum: 5}

end
 