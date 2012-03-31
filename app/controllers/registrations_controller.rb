class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super
    @profile = Profile.new
    @profile.save
  end

  protected

    def after_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

    def after_inactive_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

end
