class CreateApologies < ActiveRecord::Migration[6.1]
  def change
    create_table :apologies do |t|
      t.string :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :incident, null: false, foreign_key: true

      t.timestamps
    end
  end
end
