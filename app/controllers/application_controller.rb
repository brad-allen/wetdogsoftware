class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_account!  
  before_action :load_user_information
  before_action :load_profile_information


  def set_created data, status=nil
    data.created_by = @profile.id
    data.updated_by = @profile.id
    data.status = (status.present? ? status : 'unknown') if data.respond_to?('status')
    data.profile = @profile if data.respond_to?('profile')
  end

  def set_updated data
    data.updated_by = @profile.id
  end
  
  def load_user_information 
  	if current_account.present? && current_account.user.present?
  		@user = current_account.user 
  	else
  		@user =  nil
  	end    
  end

  def load_profile_information 
  	if current_account.present? && current_account.user.present? && current_account.user.profiles.count > 0
  		#TODO get the profile cookie and get the correct profile
      # or make them select on each login and need to log out to switch
  		@profile =  current_account.user.profiles.first
  	else
  		@profile =  nil
  	end    
  end

  def authorize_update_by_profile_id profile_id
   # return head(:forbidden) unless @profile.present? && profile_id == @profile.id
  end

  def authorize_show_by_profile_id profile_id

    #TODO depends on items permissions and user's connection/group/admin/etc status - may need to be in each controller
    #return head(:forbidden) unless @profile.present? && profile_id == @profile.id.to_s


  end

  def deny_non_admins    
	  return head(:forbidden) unless is_admin
  end

  def is_admin
     @profile.present? && @profile.permission == 'admin'
  end

  def wrap_response data_type, data
    package = ResponsePackage.new()
    package.data_type = data_type
    package.data = data
    package.count = (data.present? ? (data.respond_to?(:count) ? data.count : 1) : 0)
    package 
  end

end

