class Track < ApplicationRecord
  validates :title, :album_id, :ord, :type, presence: true
  validates :type, inclusion: { in: %w(bonus regular), message: "Please select the type of track"}

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album

end
