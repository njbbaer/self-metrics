# frozen_string_literal: true

# == Schema Information
#
# Table name: sleep_reports
#
#  id         :bigint(8)        not null, primary key
#  asleep_at  :datetime
#  wakeup_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SleepReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
