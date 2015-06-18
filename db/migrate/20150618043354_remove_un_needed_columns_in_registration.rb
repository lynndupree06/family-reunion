class RemoveUnNeededColumnsInRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :num_of_people
    remove_column :registrations, :num_of_tshirts
  end
end
