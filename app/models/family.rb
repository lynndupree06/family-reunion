class Family < ActiveRecord::Base
  belongs_to :husband, :class_name => 'Person'
  belongs_to :wife, :class_name => 'Person'
  has_many :children, :class_name => 'Person'
end
