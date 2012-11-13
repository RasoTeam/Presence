class AdminController < ApplicationController
  def index
  	if session["admin"] != nil && session["admin"] != false
  		@attendances = Attendance.order('id DESC').limit(30)
  	else
  		redirect_to "/admin/login"
  		#@attendances = Attendance.order('id DESC').limit(30)
  	end
  end

  def login
  	@attendance = Attendance.new
  end

  def logout
  	session["admin"] = false
  	redirect_to "/admin/login"
  end

  def create_admin
    if params[:attendance][:name] == 'admin' && params[:attendance][:password] == 'admin'
      session["admin"] = true
      redirect_to "/admin/index"
    else
      flash[:error] = "Login failed"
      redirect_to "/admin/login"
    end
  end
end
