class AddIncidentIdToApologies < ActiveRecord::Migration[6.1]
  def change
    add_column :apologies, :incident_id, :integer
  end
end
