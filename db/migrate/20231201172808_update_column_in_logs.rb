class UpdateColumnInLogs < ActiveRecord::Migration[7.0]
  def change
    remove_reference :logs, :photo, foreign_key: true
    add_column :logs, :photo, :string
  end
end
