class CreateFeebacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feebacks do |t|
      t.integer :star_count
      t.timestamps
    end
  end
end
