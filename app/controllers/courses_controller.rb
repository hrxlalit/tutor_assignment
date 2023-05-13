class CoursesController < ApplicationController
  
  # This action is used to fetch all the courses with its respective tutor data.
  def index
    @courses = Course.all.as_json(include: [ :tutors ])
    render json: {response_code:200,course_data: @courses, message: 'Data fetch Successfully.'}
  end

  # This action is used to create course with its tutor data
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: {response_code: 201,course:@course, message: 'Course created Successfully.'}
    else
      render json: {response_code: 422,error: @course.errors, message: 'Unable to create Result Data, Please Try Again.'}
    end
  end


  private

  def course_params
    params.require(:course).permit(:id, :name, :description, :cost_price,  tutors_attributes: [ :id, :name, :age, :total_experience, :_destroy])
  end
end
