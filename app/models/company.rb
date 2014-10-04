# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
  has_many :employees
  has_many :folders, through: :employees
end
