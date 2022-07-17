# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    report = me.reports.new(title: 'レポートのタイトル', content: 'レポートの内容')
    assert report.editable?(me)
    assert_not report.editable?(she)
  end

  test '#created_on?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    now_time = Time.zone.now
    report = me.reports.new(title: 'レポートのタイトル', content: 'レポートの内容', created_at: now_time)
    assert_not_equal report.created_at, now_time.to_date
    assert_equal report.created_on, now_time.to_date
  end
end
