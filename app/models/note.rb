class Note < ActiveRecord::Base
  validates :user, :track, :body, presence: true

  belongs_to :user
  belongs_to :track

  def to_s
    if body.length < 10
      body
    else
      "#{body[0..7]}..."
    end
  end
end
