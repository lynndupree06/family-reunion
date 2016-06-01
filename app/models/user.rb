class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable, :rememberable, 
  			:recoverable, :lockable, :trackable, :validatable
end
