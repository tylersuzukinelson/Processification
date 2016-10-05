class CreateChecklistItems < ActiveRecord::Migration
  def change
    create_table :checklist_items do |t|
      t.references :process_checklist, index: true
      t.string :name
      t.integer :ordering

      t.timestamps null: false
    end
    add_foreign_key :checklist_items, :process_checklists
    add_index :checklist_items, :ordering
  end
end
