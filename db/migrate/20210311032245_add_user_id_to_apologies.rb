class AddUserIdToApologies < ActiveRecord::Migration[6.1]
  def change
    add_column :apologies, :user_id, :integer
  end
end
