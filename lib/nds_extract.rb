$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

puts directors_totals(directors_database)


def list_of_directors(source)
  result = []
  index = 0
  while index < source.length do
    result << source[index][:name]
    index += 1
  end
  result
end


def total_gross(source)
  total = 0
  index = 0
  arr = list_of_directors(source)
  while index < arr.length do
    total = total + directors_totals(source)[arr[index]]
    index += 1
  end 
#cycle through names to find out keys

  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names 
  
  # (use visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  total
end

puts total_gross(directors_database)

