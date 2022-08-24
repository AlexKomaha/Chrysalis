class Journal < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  # validates :content, presence: true, length: { minimum: 6 }
  has_rich_text :rich_content
end
