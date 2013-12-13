class Art < ActiveRecord::Base
  belongs_to :moment
  belongs_to :user
end
