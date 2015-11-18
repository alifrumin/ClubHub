class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = "#{@membership.user.email} was added to #{@membership.club.name}"
      redirect_to @membership.club
    else
      render :new
    end
  end

def destroy
  @membership = Membership.find(params[:id])
  @membership.destroy
  redirect_to @membership.club
end
  # def edit
  #   @club = Club.find(params[:id])
  #   @members = Membership.where(club_id: params[:club_id])
  # end
  private
  def membership_params
    params.require(:membership).permit(:user_id, :club_id)
  end
end
