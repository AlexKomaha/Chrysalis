class Journal < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  # validates :content, presence: true, length: { minimum: 6 }
  has_rich_text :content

  # To format the date with st, rd, nd, th. E.g. 21st
  # def format(time)
  #   time.strftime("%A %d, %H:%M%p").sub!(/\d?\d/) do |day|
  #     case day
  #     when "1", "21", "31" then "#{day}st"
  #     when "2", "22" then "#{day}nd"
  #     when "3", "23" then "#{day}rd"
  #     else "#{day}th"
  #     end
  #   end
  # end
end
