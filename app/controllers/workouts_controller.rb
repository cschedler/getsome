class WorkoutsController < ApplicationController

	def show
		@user = current_user
		@workout = @user.workouts.find(params[:id])
		@movement = @workout.movements.build
	end
	
	def index
		@user = current_user
		@workout = @user.workouts.all
	end

	def new
		@user = current_user
		@workout = @user.workouts.build
	end

	def edit
		@user = User.find(params[:user_id])
		@workout = @user.workouts.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@workout = @user.workouts.create(workout_params)

		if @workout.save
			redirect_to([@user, @workout] )
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@workout = @user.workouts.find(params[:id])

		if @workout.update(workout_params)
			redirect_to [@user, @workout]
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		@workout = @user.workouts.find(params[:id])
		
		if @workout.destroy
			render 'index', alert: 'Deleted'
		else
			render 'index', alert: 'Not deleted'
		end
	end

	private
	def workout_params
		params.require(:workout).permit(:wrkt_date, :title)
	end
end
