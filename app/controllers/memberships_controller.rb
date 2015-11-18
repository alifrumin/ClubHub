class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = "#{@membership.email} was added to #{@membership.club.name}"
      redirect_to @membership.club
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
    @members = Membership.where(club_id: params[:club_id])
  end

def destroy
  @club = Club.find(params[:id])
  @membership = @club.membership.destroy(membership_params)
  redirect_to @membership.club
end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :club_id)
  end
end
