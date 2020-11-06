class Article < ApplicationRecord
    has_many :tags
    has_many :categories, through: :tags 
    belongs_to :user, foreign_key: "author_id"
    has_many :votes
    has_many :comments, foreign_key: "article_id"
end
