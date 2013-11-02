module AdminHelper

  def authenticate_admin_user!
    redirect_to root_path, notice: 'Please log in as an admin' unless is_admin?
  end

  def signed_in_user
    redirect_to root_path,notice: 'You have to be signed in to continue' unless current_doctor
  end

  def is_admin?
    true
    #current_doctor.email=='lnr@gmail.com'
  end

end
