# Instead of loading all of Rails, load the
# particular Rails dependencies we need
require 'sqlite3'
require 'active_record'
require 'byebug'
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
  belongs_to :parent, foreign_key: 'person_id', class_name: 'Person'

  def grand_children
    grand_children  = []
    self.children.each do |child|
      grand_children << child.children
    end
    grand_children.flatten
  end

  def descendants
    descendants = []
    self.children.each do |current_child|
      descendants << current_child
      descendants << current_child.descendants
    end
    descendants.flatten
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

person_1 = Person.find(1)
person_2 = Person.find(4)
p person_1.descendants

