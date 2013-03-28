# == Schema Information
#
# Table name: listeners
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Listener < ActiveRecord::Base
  attr_accessible :email
  has_many :subscriptions
  has_many :users, through: :subscriptions, uniq: true
  accepts_nested_attributes_for :users
end
