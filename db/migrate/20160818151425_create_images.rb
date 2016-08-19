class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.integer :course_id
      #t.integer :user_id

      t.timestamps
    end

    add_index :images, :course_id
  end
end
