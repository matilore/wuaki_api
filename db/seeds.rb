# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.destroy_all
Serie.destroy_all

puts 'destroying database movies and series'

puts 'populating seeds'


	def movies
		Random.new.rand(1..5).times do |i|
			Movie.create(title: Faker::Book.title, plot: Faker::Lorem.paragraphs(1))
		end	
	end

	def series
		Random.new.rand(1..5).times do |l|
			Serie.create(title: Faker::Book.title)
		end

		Serie.all.each do |serie|

			Random.new.rand(1..5).times do |i|
				serie.seasons.create
			end
		end

		Serie.all.each do |serie|

			serie.seasons.each do |season|

				Random.new.rand(1..5).times do |j|
					season.episodes.create(title: Faker::Book.title, plot: Faker::Lorem.paragraphs(1))
				end
			end
		end
				
	end

	def sort_mv_sr
		4.times do |s|

			s = Random.new.rand(1..2)
			
			s == 1 ? movies() : series()
		end

	end


sort_mv_sr