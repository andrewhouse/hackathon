# == Schema Information
#
# Table name: employees
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  fname                  :string(255)
#  lname                  :string(255)
#  company_id             :integer
#  roles                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :folders
  has_many :folders
  belongs_to :company
  has_many :api_keys
  validates_presence_of :company_id
  gravtastic size: '250'
end
