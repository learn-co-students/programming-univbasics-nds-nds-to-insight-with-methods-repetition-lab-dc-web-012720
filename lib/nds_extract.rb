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
  # Write this implementation
 names = []
 
 row_index = 0  
 while row_index < source.size do
   names << source[row_index][:name]
   row_index +=1
 end
 names
end

#MAIN CODE
def total_gross(source)
  
  directors_list = list_of_directors(source) # Has and array with all the director names
  directors_gross = directors_totals(source) 
  
  total_worldwide_gross = 0
  counter = 0  
    
  while counter < directors_list.size do 
    total_worldwide_gross += directors_gross[directors_list[counter]]
    counter += 1
  end
  return total_worldwide_gross
end