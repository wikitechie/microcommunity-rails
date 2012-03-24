class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :action_object, :polymorphic => true
  belongs_to :target_object, :polymorphic => true
  
end
