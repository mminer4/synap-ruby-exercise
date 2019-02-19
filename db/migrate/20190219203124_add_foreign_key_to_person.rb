class AddForeignKeyToPerson < ActiveRecord::Migration[5.2]
  def change
    change_table :people do |t|
      t.belongs_to :organization, index: true
    end
  end
end
