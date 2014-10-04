# == Schema Information
#
# Table name: items
#
#  id                  :integer          not null, primary key
#  folder_id           :integer
#  title               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  record_file_name    :string(255)
#  record_content_type :string(255)
#  record_file_size    :integer
#  record_updated_at   :datetime
#

class Item < ActiveRecord::Base
  belongs_to :folder

  has_attached_file :record
  do_not_validate_attachment_file_type :record
  validates :record, :attachment_presence => true
end
