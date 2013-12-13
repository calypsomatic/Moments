class Moment < ActiveRecord::Base
  belongs_to :user, inverse_of: :moments
  has_one :art, inverse_of: :moments
end
