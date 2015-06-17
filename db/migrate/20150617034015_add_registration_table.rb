class AddRegistrationTable < ActiveRecord::Migration
  def change
    create_table(:registrations) do |t|
      t.integer :num_of_people
      t.integer :num_of_tshirts
      t.integer :num_of_rooms

      t.timestamps
    end

    create_table(:applicants) do |t|
      t.string :first_name
      t.string :last_name
      t.string :tshirt_size

      t.timestamps
    end

    add_reference :applicants, :registration
  end
end
