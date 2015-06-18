class HomeController < ApplicationController
  def index
  end

  def new_registration
    registration = Registration.create!(:num_of_rooms => params[:num_of_rooms])

    params[:applicants].each do |a|
      Applicant.create(:first_name => a[:first_name], :last_name => a[:last_name], :registration_id => registration.id)
    end

    redirect_to :root
  end

  def register

  end
end
