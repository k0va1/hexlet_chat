class Message < ApplicationRecord
  validates :text, presence: true

  belongs_to :room

  broadcasts_to :room
end
