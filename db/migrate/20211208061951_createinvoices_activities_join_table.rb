class CreateinvoicesActivitiesJoinTable < ActiveRecord::Migration[6.0]
  def change
    # create_join_table :activities, :invoices

    # If you want to add an index for faster querying through this join:
    create_join_table :activities, :invoices do |t|
      t.index :activity_id
      t.index :invoice_id
    end
  end
end
