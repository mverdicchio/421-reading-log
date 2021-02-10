class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.integer :pages
      t.datetime :date

      t.timestamps
    end
  end
end
