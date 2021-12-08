class CreateinvoicesActivitiesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :activities_invoices do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :invoice, index: true
    end
  end
end
