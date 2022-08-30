class Article < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :image_url, presence: true
  validates :author, presence: true
end
