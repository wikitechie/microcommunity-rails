class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :action_object, :polymorphic => true
  belongs_to :target_object, :polymorphic => true

  validates :verb, :presence => true
  validates :action_object, :presence => true
  validates :user, :presence => true

  def contextual_verb
    case action_object_type
    when "Wikipage"
      case verb
      when "create"
        return "created a new wiki page"
      when "edit"
        return "edited a wiki page"
      else
        return verb
      end

    when "Group"
      case verb
      when "create"
        return "created a new group"
      else
        return verb
      end

    end
  end

end

