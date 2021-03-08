class CreateForgivenesses < ActiveRecord::Migration[6.1]
  def change
    create_table :forgivenesses do |t|
      t.resources :user
      t.resources :apology

      t.timestamps
    end
  end
end
