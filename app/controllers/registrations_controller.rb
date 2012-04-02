class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super
    @profile = Profile.create
    @profile.update_attributes( name: "User", bio: "Do not have a bio yet")
  end

  protected

    def after_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

    def after_inactive_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

end
