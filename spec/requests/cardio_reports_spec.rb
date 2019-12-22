# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CardioReports', type: :request do
  before do
    post login_path, params: { password: Rails.configuration.password }
  end

  describe 'GET /reports/cardio' do
    it 'has status ok' do
      get cardio_reports_path
      expect(response).to have_http_status(:ok)
    end
  end
end
