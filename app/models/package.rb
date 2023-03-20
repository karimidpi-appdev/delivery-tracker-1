# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  arrive_on  :date
#  content    :text
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Package < ApplicationRecord
  validates(:name, { :presence => true })
  validates(:arrive_on, { :presence => true })
end
