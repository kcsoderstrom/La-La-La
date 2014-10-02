class Track < ActiveRecord::Base
  belongs_to :album,
    inverse_of: :tracks

  has_one :band,
    through: :album

  def to_s
    self.title
  end
end
