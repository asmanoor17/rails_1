# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
   belongs_to :category
   validates :category, presence: true
  has_many :comments, dependent: :destroy
end
