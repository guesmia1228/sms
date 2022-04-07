class CollegeSubjectsController < ApplicationController
  def index
    @college_subjects = CollegeSubject.all
  end
  
  def new
    @college_subject = CollegeSubject.new
  end

  def create
    @college_subject = CollegeSubject.new(college_subject_params)
    if @college_subject.save
      redirect_to college_subjects_path
    else
      render :new
    end
  end

  def edit
    @college_subject = CollegeSubject.find(params[:id])
  end

  def update
    @college_subject = CollegeSubject.find(params[:id])
    if @college_subject.update(college_subject_params)
      redirect_to college_subjects_path
    else
      render :edit
    end
    
  end

  def destroy
    CollegeSubject.delete(params[:id])
    redirect_to college_subjects_path
  end

  private

  def college_subject_params
    params.require(:college_subject).permit(:name, :indentifier, :description)
  end
end
