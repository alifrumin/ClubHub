class Membership < ActiveRecord::Base
  belongs_to :club
  belongs_to :user
  delegate :email, :to => :user
  # def email
  #   user.email
  # end
end
