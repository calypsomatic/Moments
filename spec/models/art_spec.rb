require 'spec_helper'

describe Art do
  it { should belong_to(:moment) }
  it { should belong_to(:user) }
end
