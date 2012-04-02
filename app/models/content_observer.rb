class ContentObserver < ActiveRecord::Observer
  observe :wikipage

  def after_create(action_object)
    Activity.create!(
      :user_id => action_object.user.id,
      :action_object_id => action_object.id,
      :action_object_type => action_object.class.to_s,
      :verb => "create",
      :created_at => action_object.created_at,
      :updated_at => action_object.updated_at)
  end

  def after_update(action_object)
    Activity.create!(
      :user_id => User.current_user.id,
      :action_object_id => action_object.id,
      :action_object_type => action_object.class.to_s,
      :verb => "edit",
      :created_at => action_object.created_at,
      :updated_at => action_object.updated_at)
  end

end

