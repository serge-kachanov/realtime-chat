class Message < ActiveRecord::Base

  validates_presence_of :text
  validates_presence_of :user

  belongs_to :user

end
