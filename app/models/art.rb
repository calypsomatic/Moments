class Art < ActiveRecord::Base
  belongs_to :moment
  belongs_to :user
  mount_uploader :grabby, GrabbyUploader

  class << self
    def in_progress? (user)
      arts = Art.where(user: user)
      if arts.empty?
        return false
      end
      art_in_progress = false
      arts.each do |art|
        if art.in_progress?
          art_in_progress = true
        end
      end
      art_in_progress
    end

    def in_progress
      where(in_progress: true)
    end
  end
end
