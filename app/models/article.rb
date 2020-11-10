class Article < ApplicationRecord


    belongs_to :category, foreign_key: "category_id" 
    belongs_to :user, foreign_key: "author_id"
    has_many :votes
    has_many :comments, foreign_key: "article_id"
    has_one_attached :image, dependent: :destroy
end
