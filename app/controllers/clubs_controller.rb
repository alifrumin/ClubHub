class ClubsController < ApplicationController
  # index
  def index
    @clubs = Club.all
  end

  # new
  def new
    @club = Club.new
  end

  # create
  def create
    @club = Club.new(club_params)
    if @club.save
      flash[:notice] = "#{@club.name} was successfully created."
      redirect_to @club
    else
      render :new
    end
  end

  #show
  def show
    @club = Club.find(params[:id])
  end

  # edit
  def edit
    @club = Club.find(params[:id])
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
end
