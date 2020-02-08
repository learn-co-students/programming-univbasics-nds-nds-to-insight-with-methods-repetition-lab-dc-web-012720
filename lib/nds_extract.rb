$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

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
  list = []
  i = 0 
  while i < source.length do 
    dir = source[i][:name]
    list << dir 
    i += 1 
  end
  return list
end

def total_gross(source)
  lod = list_of_directors(source)
  dt = directors_totals(source)
  total = 0 
  i = 0 
  while i < lod.length do 
    direc_name = lod[i]
    total += dt[direc_name]
    i += 1 
  end
  total
end

pp directors_database

