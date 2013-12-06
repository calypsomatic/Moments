class Moment < ActiveRecord::Base
  belongs_to :user, inverse_of: :moments
  validates :sentence, length: { maximum: 250 } # added from tutorial, probably won't keep
end
