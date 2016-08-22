class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lesson, only: [:show]

	def show
	end

	private

	helper_method :current_lesson, :find_current_course
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

    def current_course_for_lesson
    	@current_course_for_lesson ||= current_lesson.section.course
    end


	def require_authorized_for_current_lesson
		@current_course_for_lesson = current_lesson.section.course
		if current_user.enrolled_in?(current_course_for_lesson) == false
			redirect_to course_path(current_course_for_lesson), alert: 'Unauthorized -- If you are not registered you cannot view the lessons.  Please enroll.'
		
		end
	end
	
end
