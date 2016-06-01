class CreateFamilyMemberTables < ActiveRecord::Migration
  def change
    create_table(:people) do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :dob_location
      t.string :gender

      t.timestamps
    end

    create_table(:families) do |t|
      t.integer :husband_id
      t.integer :wife_id
      t.date :marriage_date
      t.string :marriage_location

      t.timestamps
    end

    create_table(:children) do |t|
      t.references :person
      t.references :family
      t.string :father_relation
      t.string :mother_relation

      t.timestamps
    end
  end
end
