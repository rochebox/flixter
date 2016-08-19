class Instructor::ImagesController < ApplicationController
		before_action :authenticate_user!
	def create
		@user = current_user
		@course = Course.find(params[:course_id])
		#this line is from nomster lesson 10 with out the merge and it didnt work
		#@course.images.create(image_params)

		# trying something from http://stackoverflow.com/questions/3839779/rails-create-on-has-one-association
		@image = Image.create(image_params)
		@course.image = @image
		# @user.images = @image  not sure what to do with the user who is "has many"
		redirect_to instructor_course_path(@course)
	end

	private
	def image_params
		params.require(:image).permit(:caption, :imageupload)
	end
end
