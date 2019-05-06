require './blog'


p Article.joins(:category, :comments)
p Article.joins(comments: :guest)
p Category.joins(articles: [{ comments: :guest }, :tags])
