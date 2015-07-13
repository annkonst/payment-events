class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  DONTANSWERED = 0
  ACCEPT = 1
  REJECT = 2

end
