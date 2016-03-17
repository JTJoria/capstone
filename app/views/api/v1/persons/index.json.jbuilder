json.array! @people do |persons|
  json.id person.id
  json.name persons.name
  json.name persons.gender
  json.name persons.age

end