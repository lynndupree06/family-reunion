class TreeController < ApplicationController
  respond_to :json

  def hierarchical_tree
    gender = Person.find(params[:id]).gender

    if gender === 'F'
      @family = Family.where(:wife_id => params[:id])
    else
      @family = Family.where(:husband_id => params[:id])
    end

    render json: @family.to_json(:include => [:husband, :wife, {:children => {:order => :dob}}])
  end

  def pedigree_tree
  end
end