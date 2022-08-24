class UserGoal < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :description, presence: true
  enum status: [ :active, :done, :inactive ]

  SUGGESTED = ["Edit resume", "Change the bedsheets", "Make myself dinner", "Make my bed", "Take a shower or a bath", "Make myself lunch", "Talk to a family member or friend", "Brush my teeth", "Wash the dishes", "Take a short walk", "Clean my room", "Change clothes", "Do my laundry"]
end
