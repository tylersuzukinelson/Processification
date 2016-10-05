class CreateRetroSessions < ActiveRecord::Migration
  def change
    create_table :retro_sessions do |t|

      t.timestamps null: false
    end
  end
end
