class Person < ActiveRecord::Base
  belongs_to :family
  has_many :wives, through: :family
  has_many :husbands, through: :family
end
