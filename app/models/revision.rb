class Revision < ActiveRecord::Base

  belongs_to :user
  belongs_to :wikipage

end
