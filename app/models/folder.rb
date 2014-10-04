# == Schema Information
#
# Table name: folders
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Folder < ActiveRecord::Base
  belongs_to :employee
  has_many :items

  def size
    items.map(&:record_file_size).inject(&:+)
  end

end
