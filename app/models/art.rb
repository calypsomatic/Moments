class Art < ActiveRecord::Base
  belongs_to :moment
  belongs_to :user

  class << self
    def in_progress? (user)
      arts = Art.where(user: user)
      art_in_progress = false
      arts.each do |art|
        if art.in_progress?
          art_in_progress = true
        end
      end
      art_in_progress
    end
  end
end
