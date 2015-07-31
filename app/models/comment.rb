class Comment < ActiveRecord::Base
	validates :author, presence: true,
					  length: { minimum: 5}
end
