# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?' do
    report = @alice.reports.new(title: 'レポートのタイトル', content: 'レポートの内容')
    assert report.editable?(@alice)
    assert_not report.editable?(@bob)
  end

  test '#created_on?' do
    now_time = Time.zone.now
    report = @alice.reports.new(title: 'レポートのタイトル', content: 'レポートの内容', created_at: now_time)
    assert_not_equal report.created_at, now_time.to_date
    assert_equal report.created_on, now_time.to_date
  end
end
