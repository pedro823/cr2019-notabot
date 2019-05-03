class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :author
      t.text :message

      t.timestamps
    end

    drop_table :message_tables
  end
end
