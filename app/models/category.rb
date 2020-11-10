class Category < ApplicationRecord
    has_many :articles, foreign_key: "category_id"
end
