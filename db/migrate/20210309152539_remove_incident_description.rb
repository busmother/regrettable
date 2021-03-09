class RemoveIncidentDescription < ActiveRecord::Migration[6.1]
  def change
    remove_column :incidents, :description
  end
end
