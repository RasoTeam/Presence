class Attendance < ActiveRecord::Base
  attr_accessible :name, :password

  validates_presence_of :name, :password, :message => "necessario"
end
