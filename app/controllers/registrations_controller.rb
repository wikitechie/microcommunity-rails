class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        @user = User.find_by_email(params[:user][:email])
        Profile.create(:user_id => @user.id, :name => params[:name])
        #@profile.update_attributes( name: "User", bio: "Do not have a bio yet")
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end

  end

  protected

    def after_sign_up_path_for(resource)
      "/profiles/#{current_user.id}"
    end

    def after_inactive_sign_up_path_for(resource)
      "/profiles/#{current_user.id}"
    end

end