# frozen_string_literal: true

class ReportsCollection
  def latest
    ordered_by_recency.last
  end

  def first
    ordered_by_recency.first
  end

  def days_since_latest(offset: 0.hours)
    return nil if latest.nil?

    ((Time.now - offset).to_date - latest.date).to_i
  end

  def collection
    @collection ||= model.all
  end

  def ordered_by_recency
    @ordered_by_recency ||= collection.sort_by(&:date)
  end
end
