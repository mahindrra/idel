class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.role.name == 'admin'
      dashboard_admin_home_path
    elsif resource.role.name =='teacher'
    	dashboard_teacher_home_path
    else
    	dashboard_student_home_path
    end
  end

  def is_admin?
  	if current_user.present?
  		if current_user.check_if_admin?
  		else
  		redirect_to root_path, alert: "You don't have permission to access this page."	
  		end	
  	end	
  end	
end
