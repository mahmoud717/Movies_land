class User < ApplicationRecord
    has_many :articles, foreign_key: "author_id"
    has_many :votes ,foreign_key: "user_id"
    has_many :comments, foreign_key: "user_id"
end
