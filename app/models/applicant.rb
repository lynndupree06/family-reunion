class Applicant < ActiveRecord::Base
  has_one :registration
end