# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Report.find_by(params[:report_id])
  end
end
