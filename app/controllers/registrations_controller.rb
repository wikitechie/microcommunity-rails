class RegistrationsController < Devise::RegistrationsController

  protected

    def after_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

    def after_inactive_sign_up_path_for(resource)
      "/profiles/#{current_user.id}/edit"
    end

end
