class Band < ActiveRecord::Base
  has_many :albums,
    dependent: :destroy

  has_many :tracks,
    through: :albums

  def to_s
    self.name
  end

end
