require 'spec_helper'

describe User do
  it { should have_many(:moments) }
  # it { should have_one(:art_in_progress) }
  it { should have_many(:arts) }
end