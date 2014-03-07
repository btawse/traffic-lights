class CreateJunctions < ActiveRecord::Migration
  def change
    create_table :junctions do |t|
      t.string :name

      t.timestamps
    end
  end
end
