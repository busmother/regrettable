class CreateForgivenesses < ActiveRecord::Migration[6.1]
  def change
    create_table :forgivenesses do |t|
      t.integer :user_id
      t.integer :apology_id

      t.timestamps
    end
  end
end
