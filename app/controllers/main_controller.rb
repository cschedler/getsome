class MainController < ApplicationController
  def index
  	@admin = User.find_by(admin: true)
  	@wod = @admin.workouts.find_by(wrkt_date: Date.today)
  end
end
