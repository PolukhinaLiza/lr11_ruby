class CreateRafsons < ActiveRecord::Migration[6.1]
  def change
    create_table :rafsons do |t|
      t.float :number
      t.string :array

      t.timestamps
    end
  end
end
