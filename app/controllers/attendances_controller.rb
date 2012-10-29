class AttendancesController < ApplicationController
  
  def index
  	@attendances = Attendance.order('id DESC').limit(30)
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
    if @attendance.save
      #redirect_to attendance_path(@attendance)
      redirect_to root_path
    else
      @attendances = Attendance.order('id DESC').limit(30)
      render 'index'
    end
  end

  def destroy
  	Attendance.find(params[:id]).destroy
  	redirect_to attendances_path
  end

end
