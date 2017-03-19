# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CastMember.create([
  {
    description: 'A Sith leader',
    name: 'Darth Vader'
  }
])

Director.create([
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Darth Vader',
  },
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Luke Skywalker',
  },
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Han Solo',
  },  
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Chewbacca',
  }
])

Writer.create([
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Darth Vader',
  },
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Luke Skywalker',
  },
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Han Solo',
  },  
  {
    birthday: Time.now - 10.years,
    description: 'A fine cast member',
    died: Time.now - 1.day,
    name: 'Chewbacca',
  }
])

Category.create([
	{
	  name: 'Horror'
	},
    {
      name: 'Drama'
    }
])

ProductionCompany.create([
	{
	  name: 'Warner Brothers'
	},
    {
      name: 'Disney'
    }
])

Movie.create([
  {
    budget: 20000000,
    country: 'USA',
    filming_locations: 'Hollywood, Ca',
    gross: 100000000,
    language: 'English',
    motion_picture_rated: 'R',
    official_site: 'http://www.themovie.com',
    rating: 8.1,
    release_date: Time.now - 10.years,
    runtime: 2.hours,
    storyline: 'A movie about things.',
    title: 'The Movie part 1',
    vote_count: 1403
  }, {
    budget: 10000000,
    country: 'USA',
    filming_locations: 'Hollywood, Ca',
    gross: 50000000,
    language: 'English',
    motion_picture_rated: 'R',
    official_site: 'http://www.themovie.com',
    rating: 7.8,
    release_date: Time.now - 10.years,
    runtime: 2.hours,
    storyline: 'A movie about things.',
    title: 'The Movie part 2',
    vote_count: 1403
  }, {
    budget: 10000000,
    country: 'USA',
    filming_locations: 'Hollywood, Ca',
    gross: 50000000,
    language: 'English',
    motion_picture_rated: 'R',
    official_site: 'http://www.themovie.com',
    rating: 5.6,
    release_date: Time.now - 10.years,
    runtime: 2.hours,
    storyline: 'A movie about things.',
    title: 'The Movie part 3',
    vote_count: 1403
  }, {
    budget: 10000000,
    country: 'USA',
    filming_locations: 'Hollywood, Ca',
    gross: 50000000,
    language: 'English',
    motion_picture_rated: 'R',
    official_site: 'http://www.themovie.com',
    rating: 3.4,
    release_date: Time.now - 10.years,
    runtime: 2.hours,
    storyline: 'A movie about things.',
    title: 'The Movie part 4',
    vote_count: 1403
  }
])
