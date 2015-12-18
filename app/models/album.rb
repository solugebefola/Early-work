class Album < ActiveRecord::Base
  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id,
    dependent: :destroy
  )

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )
end
