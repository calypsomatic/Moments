class Moment < ActiveRecord::Base
  # attr_accessible :day

  belongs_to :user, inverse_of: :moments
  has_one :art, inverse_of: :moments

  # def start_time
  #  day
  # end
end
