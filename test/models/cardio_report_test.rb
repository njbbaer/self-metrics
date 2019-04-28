# frozen_string_literal: true

# == Schema Information
#
# Table name: cardio_reports
#
#  id               :bigint(8)        not null, primary key
#  cardio_type      :integer
#  distance_miles   :float
#  duration_seconds :integer
#  finished_at      :datetime
#  machine          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


require 'test_helper'

class CardioReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
