require 'sqlite3'
require 'active_record'

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

# Set up database tables and columns
ActiveRecord::Schema.define do
  
  create_table :categories, force: true do |t|
    t.string :name
  end
  
  create_table :articles, force: true do |t|
    t.string :title
    t.references :category
  end
  
  create_table :comments, force: true do |t|
    t.string :text
    t.references :article
  end
  
  create_table :guests, force: true do |t|
    t.string :name
    t.references :comment
  end 
  
  create_table :tags, force: true do |t|
    t.string :name
    t.references :article
  end
end

class Category < ActiveRecord::Base
  # attr_accessor :name
  has_many :articles
end

class Article < ActiveRecord::Base
  # attr_accessor :title
  belongs_to :category
  has_many :comments
  has_many :tags  
end

class Comment < ActiveRecord::Base
  # attr_accessor :text
  belongs_to :article
  has_one :guest 
end

class Guest < ActiveRecord::Base
  #attr_accessor :name
  belongs_to :comment
end

class Tag < ActiveRecord::Base
  #attr_accessor :name
  belongs_to :article
end

categories = ['politics', 'sports', 'media']
articles = [
  {title: 'abc', category_id: 1},
  {title: 'er', category_id: 1},
  {title: 'fd', category_id: 2},
  {title: 'vc', category_id: nil},
  {title: 'bjmh', category_id: nil},
  {title: 'yht', category_id: 2},
  {title: 'uy', category_id: nil}
]
comments = [
  {text: 'sadf', article_id: 1}, 
  {text: 'rter', article_id: 1}, 
  {text: 'fgh', article_id: 2}
]
guests = [
  {name: 'zabir', comment_id: 1},
  {name: 'munira', comment_id: 2},
  {name: 'jesmina', comment_id: 3}
]
tags = [
  {name: 'cool', article_id: 1},
  {name: 'cool', article_id: 1},
  {name: 'sd', article_id: 2},
  {name: 'cs', article_id: 2},
  {name: 'vbcn', article_id: 3},
  {name: 'ety', article_id: 3}
]

categories.each {|i| Category.create!(name: i)}
articles.each {|i| Article.create!(title: i[:title], category_id: i[:category_id])}
comments.each {|i| Comment.create!(text: i[:text], article_id: i[:article_id])}
guests.each {|i| Guest.create!(name: i[:name], comment_id: i[:comment_id]) }
tags.each {|i| Tag.create!(name: i[:name], article_id: i[:article_id]) }



