require "./book.rb"
require "./additional_methods.rb"
require "yaml"
class Bookshelf

	attr_reader :books, :author_list, :kind_list

	def initialize
		@books=[]
		@author_list=[]
		@kind_list=[]
		open()
	end


	def run
		loop do
			puts "Bookshelf:"
			puts "a: Add book"
			puts "p: Print bookshelf"
			puts "e: Exit"


			case gets.chomp.downcase
			when "a"
				add_book
			when "p"
				print_shelf
			when "r"
				create_kind_list
				create_author_list

			when "e"
				save()
				break
			end
		end
	end


	def save
		File.open("books.yml", "w") do |file|
		file.write(books.to_yaml)
		end
		File.open("authors.yml", "w") do |file|
		file.write(author_list.to_yaml)
		end
		File.open("kinds.yml", "w") do |file|
		file.write(kind_list.to_yaml)
		end
	end

	def open
		if File.exists?("books.yml")
			@books=YAML.load_file("books.yml")
		end
		if File.exists?("authors.yml")
			@author_list=YAML.load_file("authors.yml")
		end
		if File.exists?("kinds.yml")
			@kind_list=YAML.load_file("kinds.yml")
		end
	end



	def add_book
		book=Book.new

		print "Name of the book: "
		book.name=gets.chomp

		if check("Is the book part of the series? (Y/N): ")
			book.series_on
			print "Name of the series: "
			series_name=gets.chomp
			print "Number of volume (or leave empty): "
			volume=gets.chomp
		end


		book.author=choose_author


		book.kind=choose_kind


		loop do
			print "Rate the book (0-10): "
			rate=gets.chomp
			if (book.rate=float?(rate))&&float?(rate).between?(0,10)
				break
			else
				puts "The rate You have inserted is not float between 0 and 10!"
			end
		end

		puts "Add comment (or leave empty): "
		book.comment="no comment" if (book.comment=gets.chomp)==""

		books<<book

	end




	def create_author_list
		list=[]
		books.each do |book|
			list.push(book.author) if !list.include?(book.author)
		end
		@author_list=list
	end

	def choose_author
		puts "Choose the Author using proper number: "
		i=0
		puts "Number".ljust(10) + "Author"
		puts "a".ljust(10,".")+"Add new Author"
		author_list.each do |author|
			puts i.to_s.ljust(10,".")+author
			i+=1
		end
		if (position=(choice(author_list.length)))=="a"
			author=gets.chomp
		else
			author=author_list[position.to_i]
		end
		author
	end

	def create_kind_list
		list=[]
		books.each do |book|
			list.push(book.kind) if !list.include?(book.kind)
		end
		@kind_list=list
	end

	def choose_kind
		puts "Choose kind of the book using proper number: "
		i=0
		puts "Number".ljust(10) + "Kind"
		puts "a".ljust(10,".")+"Add new kind"
		kind_list.each do |kind|
			puts i.to_s.ljust(10,".")+kind
			i+=1
		end
		if (position=(choice(kind_list.length)))=="a"
			kind=gets.chomp
		else
			kind=kind_list[position.to_i]
		end
		kind
	end


	def print_shelf
		puts "-"*80
		books.each do |book|
			puts book
		end
		puts "-"*80
	end





end











bookshelf=Bookshelf.new



# book=Book.new
# book.series_on
# book.series_name="Metro"
# book.volume="1"
# book.name="Metro 2033"
# book.author="D.Glukhowski"
# book.rate=8.0
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.series_on
# book.series_name="Metro"
# book.volume="2"
# book.name="Metro 2034"
# book.author="D.Glukhowski"
# book.rate=7.5
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Wyprawa czarownic"
# book.author="T.Pratchett"
# book.rate="??"
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Komórka"
# book.author="S.King"
# book.rate=7.2
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Cztery pory roku"
# book.author="S.King"
# book.rate=8.2
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Zgroza w Dunwich"
# book.author="H.P.Lovecraft"
# book.rate=8.4
# book.kind="Horror"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Dzienniki gwiazdowe"
# book.author="S.Lem"
# book.rate=8.6
# book.kind="Science fiction"
# book.comment="no comment"
# bookshelf.books<<book
#
#
#
# bookshelf.create_kind_list
# bookshelf.create_author_list


# # bookshelf.books.each {|book| puts book}

# # bookshelf.create_kind_list

# # a=bookshelf.choose_kind

# # puts "-"*50

# # print a




# bookshelf.add_book

bookshelf.run
