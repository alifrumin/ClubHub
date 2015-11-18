class MeetingsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@meetings = Meeting.all
	end

	def new
		@club = Club.find(params[:club_id])
		# @user = @club.user
		@meeting = Meeting.new
		# if @user != current_user
		# 	flash[:alert] = "Access denied! You can't add a meeting to someone else's club."
		# 	redirect_to club_path(@club)
		# end
	end

	def create
		@club = Club.find(params[:club_id])
		@meeting = Meeting.create!(meeting_params.merge(club: @club))
		redirect_to club_path(@club)
	end

	def show
		@club = Club.find(params[:club_id])
		@meeting = Meeting.find(params[:id])
		# @user = @club.user
	end

	def edit
		@club = Club.find(params[:club_id])
		@meeting = Meeting.find(params[:id])
		# @user = @club.user
		# if @user != current_user
		# 	flash[:alert] = "Access denied! You can't edit someone else's pin."
		# 	redirect_to club_meeting_path(@club, @meeting)
		# end
	end

	def update
		@club = Club.find(params[:club_id])
		# @user = @club.user
		@meeting = Meeting.find(params[:id])
		@meeting.update(meeting_params.merge(club: @club))
		redirect_to club_path(@club)
	end

	def destroy
		@club = Club.find(params[:club_id])
		@meeting = Meeting.find(params[:id])
		@meeting.destroy
		redirect_to club_path(@club)
	end

	private
	def meeting_params
		params.require(:meeting).permit(:club_id, :meeting_image, :attending, :invited, :host, :details, :theme, :user_id, :location, :datetime, :title)
	end

end
