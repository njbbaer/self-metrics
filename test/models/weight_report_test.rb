# frozen_string_literal: true
# == Schema Information
#
# Table name: weight_reports
#
#  id            :bigint(8)        not null, primary key
#  datestamp     :date
#  weight_pounds :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class WeightReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
