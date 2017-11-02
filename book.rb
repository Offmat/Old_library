class Book

	attr_accessor :name, :author, :rate, :kind, :comment, :ownership, :series_name, :volume

	def initialize
		@series = false
		ownership = :owned
	end

	def to_s
		if @series
			"Series '#{series_name}', Volume #{volume}:\n" + "Title: #{name}".ljust(35) + "Author: #{author}".ljust(25) + "Rate: #{rate.to_s}".ljust(25) + "Kind: #{kind}".ljust(25) + "Comment: #{comment}"
		else
			"Title: #{name}".ljust(35) + "Author: #{author}".ljust(25) + "Rate: #{rate.to_s}".ljust(25) + "Kind: #{kind}".ljust(25) + "Comment: #{comment}"
		end
	end

	def series_on
		@series=true
	end

end



