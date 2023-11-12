class Category < ApplicationRecord
    has_many :articles
    validates :name, presence: true, uniqueness: true
    validates :description, length: {maximum: 255}
end
