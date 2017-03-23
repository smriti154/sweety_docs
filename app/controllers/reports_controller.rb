class ReportsController < ApplicationController

  def show_reports
    @user = current_user
  end
 
end
