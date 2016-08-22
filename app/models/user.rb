class User < ActiveRecord::Base
	has_many :courses
	has_many :enrollments
	has_many :enrolled_courses, through: :enrollments, source: :course
	#has_many :images not anymore...
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
  	#Lesson 26 using a collect...
     # enrolled_courses = enrollments.collect do |enrollment|
     #    enrollment.course
     # end
     #Lesson 26 N+1 query (try to avoid go to through many)
     #enrolled_courses = enrollments.collect(&:course)

     return enrolled_courses.include?(course)
  end

end
