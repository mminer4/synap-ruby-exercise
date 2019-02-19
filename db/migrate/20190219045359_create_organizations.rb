class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :domain
      t.string :phone
      t.integer :people_count

      t.timestamps
    end

    add_index :organizations, :name, unique: true
  end
end
