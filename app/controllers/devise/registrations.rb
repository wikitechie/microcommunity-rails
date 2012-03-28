class RegistrationsController < Devise::RegistrationsController

	protected

		def after_sign_up_path_for(resource)
			'/profile/' + current_user.id
		end

		def after_inactive_sign_up_path_for(resource)
			'/profile/' + current_user.id
		end

end
