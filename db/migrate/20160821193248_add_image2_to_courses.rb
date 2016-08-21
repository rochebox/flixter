class AddImage2ToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :image2, :string
  end
end
