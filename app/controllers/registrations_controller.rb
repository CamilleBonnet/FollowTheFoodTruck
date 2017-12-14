class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      User.create(registration_id: resource.id, first_name: "First Name", last_name: "Last Name")
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_user_profile_path
  end
end
