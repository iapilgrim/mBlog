class Article < ActiveRecord::Base
  attr_accessible :content, :name, :title

  validates	:title,	:presence => true,
  							:length => { :minimum => 5}
end
