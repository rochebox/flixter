class AddImageuploadToImages < ActiveRecord::Migration
  def change
    add_column :images, :imageupload, :string
  end
end
