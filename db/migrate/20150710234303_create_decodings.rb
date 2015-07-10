class CreateDecodings < ActiveRecord::Migration
  def change
    create_table :decodings do |t|
      t.text :plain
      t.text :encrypted

      t.timestamps null: false
    end
  end
end
