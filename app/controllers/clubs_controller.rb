class ClubsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_post, only: [:show, :edit, :update, :destroy]

  # index
  def index
    @clubs = Club.all
  end

  # new
  def new
    @club = Club.new
    @user = current_user #have this in multiple actions, could make another before_action

  end

  # create
  def create
    @user = current_user
    @club = Club.new(club_params)
    if @club.save!
      flash[:notice] = "#{@club.name} was successfully created."
      @club.memberships.create!(user: @user)
      redirect_to @club

    else
      render :new
    end
  end

  #show
  def show
    @club = Club.find(params[:id])
    @meetings = @club.meetings
    @members = @club.memberships

  end

  # edit
  def edit
    @club = Club.find(params[:id]) #remove since have before_action

    @members = Membership.where(club_id: params[:club_id])
    # @user = @club.user
    # if @user != current_user
    #   flash[:alert] = "Access denied! You can't edit someone else's pin."
    #   redirect_to clubs_path
    # end
  end

  # update
  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      flash[:notice] = "#{@club.name} was successfully updated."
      redirect_to @club
    else
      render :edit
    end
  end

  # destroy
  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to clubs_path
  end

private

  def club_params
    params.require(:club).permit(:name, :description, :img_url)
  end

  def membership_params
    params.require(:membership).permit(:user_id, :club_id)
  end

  def set_post
    @club = Club.find(params[:id])
  end
end
