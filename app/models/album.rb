class Album < ActiveRecord::Base
  validate :release_year_reasonable

  belongs_to :band

  has_many :tracks,
    dependent: :destroy

  def to_s
    self.title
  end

  private
  def release_year_reasonable
    if @release_year && @release_year > Date.current.year.to_i
      flash[:errors] << "That's after today no."
    end
  end
end
