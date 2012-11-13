class AttendancesController < ApplicationController
  
  def index
  	@attendances = Attendance.order('id DESC').limit(20)
    @attendance = Attendance.new
  end

  def show
  	@attendance = Attendance.find(params[:id])
  end

  def new
  	@attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(params[:attendance])
    
    respond_to do |format|

      if @attendance.save
        #redirect_to attendance_path(@attendance)
        format.html { redirect_to root_path }
      else
        @attendances = Attendance.order('id DESC').limit(20)
        format.html { render 'index' }
      end
      format.js
    end
  end

  def destroy
  	Attendance.find(params[:id]).destroy
  	redirect_to attendances_path
  end

end
