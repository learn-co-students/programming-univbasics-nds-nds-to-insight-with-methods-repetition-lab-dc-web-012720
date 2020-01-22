$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

require 'pry'

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

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  count = 0
  output = []
  while count < source.length
    output.push(source[count][:name])
    count += 1
  end
  return output
end

def total_gross(source)
  grand_total = 0
  director_index = 0
  d_hash = directors_totals(source)
  array = d_hash.keys
 
  while director_index < d_hash.length do
    grand_total += d_hash[array[director_index]]
    director_index += 1
  end
  
return grand_total
  
  #while director_index < source.length do
   # director_index += 1
 # end
#return grand_total

  
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


