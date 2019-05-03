class CreateMessageTable < ActiveRecord::Migration[5.2]
  def change
    create_table :message_tables do |t|
      t.string :author
      t.text :message
    end
  end
end
