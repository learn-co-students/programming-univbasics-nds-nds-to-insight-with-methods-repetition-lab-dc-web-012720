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
    names = []
  i = 0
  while i < source.size do
    names << source[i][:name]
    i += 1
  end
  names
end

def total_gross(source)
  directors_gross = directors_totals(source)
  directors_names = list_of_directors(source)
  i = 0

  total = 0

  while i < directors_names.size do
    directors_name = directors_names[i]
    total += directors_gross[directors_name]
    i += 1
  end
  total
end


