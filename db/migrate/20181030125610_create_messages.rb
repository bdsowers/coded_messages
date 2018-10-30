class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :code
      t.string :message
      t.text :description

      t.timestamps
    end
  end
end
