class CreateProcessChecklists < ActiveRecord::Migration
  def change
    create_table :process_checklists do |t|
      t.references :team_process, index: true
      t.string :name
      t.integer :ordering

      t.timestamps null: false
    end
    add_foreign_key :process_checklists, :team_processes
    add_index :process_checklists, :ordering
  end
end
