class Calendar < ApplicationRecord
  validates :calendar_title, presence: true
  validates :calendar_content, presence: true
end
