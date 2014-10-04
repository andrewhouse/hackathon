class AddAttachmentRecordToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :record
    end
  end

  def self.down
    remove_attachment :items, :record
  end
end
