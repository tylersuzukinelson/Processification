class CreateEstimationSessions < ActiveRecord::Migration
  def change
    create_table :estimation_sessions do |t|

      t.timestamps null: false
    end
  end
end
