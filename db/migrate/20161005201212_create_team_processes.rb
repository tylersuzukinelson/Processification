class CreateTeamProcesses < ActiveRecord::Migration
  def change
    create_table :team_processes do |t|
      t.references :team, index: true
      t.string :name
      t.integer :ordering

      t.timestamps null: false
    end
    add_foreign_key :team_processes, :teams
    add_index :team_processes, :ordering
  end
end
