class PeopleController < ApplicationController
  respond_to :json

  def index
    @people = Person.all.order('first_name ASC')
    render json: @people
  end
end