class RemoveApologiesIndices < ActiveRecord::Migration[6.1]
  def change
    remove_column :apologies, :incident_id, :index
    remove_column :apologies, :user_id, :index
  end
end
