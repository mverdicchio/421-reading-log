class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :birthplace
      t.text :favorite_song

      t.timestamps
    end
  end
end
