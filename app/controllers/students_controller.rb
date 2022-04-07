class StudentsController < ApplicationController

  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
    
  end

  def destroy
    Student.delete(params[:id])
    redirect_to students_path
    # olhar na regra de negócio se existe uma proibição de exclusão de aluno por turma, curso e etc.
  end

  private

  def student_params
    params.require(:student).permit(:name, :registration)
  end
end
