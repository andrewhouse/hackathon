class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :folder_id
      t.string :title

      t.timestamps
    end
  end
end
