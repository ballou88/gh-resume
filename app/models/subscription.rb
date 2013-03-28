# == Schema Information
#
# Table name: subscriptions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  listener_id :integer
#  repo_ids    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subscription < ActiveRecord::Base
  attr_accessible :user, :listener, :repo_ids
  belongs_to :listener
  belongs_to :user
  serialize :repo_ids
end
