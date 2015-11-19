class Membership < ActiveRecord::Base
  belongs_to :club
  belongs_to :user
  #validate unique?
end
