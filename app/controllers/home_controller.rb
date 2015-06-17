class HomeController < ApplicationController
  def index
  end

  def register
    Registration.create(:num_of_people => params[:num_of_people],
                        :num_of_tshirts => params[:num_of_tshirts],
                        :num_of_rooms => params[:num_of_rooms])

    redirect_to :root
  end
end
