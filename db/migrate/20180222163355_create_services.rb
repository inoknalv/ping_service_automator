class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :host
      t.integer :port
      t.string :current_status

      t.timestamps
    end
  end
end
