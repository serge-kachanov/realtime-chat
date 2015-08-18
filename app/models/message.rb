class Message < ActiveRecord::Base

  attr_accessor :username

  validates_presence_of :text
  validates_presence_of :user

  belongs_to :user

end
