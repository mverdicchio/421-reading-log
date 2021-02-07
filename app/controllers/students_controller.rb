class EntriesController < ApplicationController
    
    def index
        @students = Student.all
    end
    
    def show
        @student = Student.find(params[:id])
    end
    
    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student Created!" }
      else
        format.html { render action: 'new' }
      end
    end
    end
  
    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
    end
  
    def destroy
      @student = Student.find(params[:id])
      @student.destroy

      redirect_to root_path
    end
  
    private
    def student_params
      params.require(:student_id)
    end
end
