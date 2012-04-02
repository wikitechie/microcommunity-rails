class GroupObserver < ActiveRecord::Observer
  def after_create(group)
    Activity.create!(
      :user_id => User.current_user.id,
      :action_object_id => group.id,
      :action_object_type => group.class.to_s,
      :verb => "create",
      :created_at => group.created_at,
      :updated_at => group.updated_at)
  end
end

