class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    return"/creators/#{@creator.id}/edit"
  end

  def after_inactive_sign_up_path_for(resource)
    return"/creators/#{@creator.id}/edit"
  end

end