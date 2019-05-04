# Instead of loading all of Rails, load the
# particular Rails dependencies we need
require 'sqlite3'
require 'active_record'

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :people, force: true do |t|
    t.string :name
    t.references :person
  end
end

class Person < ActiveRecord::Base
  has_many :children, foreign_key: 'person_id', class_name: 'Person'
  belongs_to :person, class_name: 'Person'

  def find_grand_children
    all_children = self.children
    all_grand_c = []
    all_children.each do |c|
      all_grand_c << c.children
    end
    all_grand_c
  end
end

# Seed Data
people = [
  {name: 'Kashem'},
  {name: 'Hakim', person_id: 1},  
  {name: 'Abul', person_id: 1}, 
  {name: 'Zabir', person_id: 3}, 
  {name: 'Maryam', person_id: 4},
  {name: 'Rana', person_id: 2}
]
people.each do |i|
  Person.create!(name: i[:name], person_id: i[:person_id])
end

person = Person.find(1)
p person.find_grand_children

