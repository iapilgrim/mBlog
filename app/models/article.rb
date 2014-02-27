# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base

  validates   :title, :presence => true,
                      :length => { :minimum => 5}
  has_many :comments, :dependent => :destroy
end
