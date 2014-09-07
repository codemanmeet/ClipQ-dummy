class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :value

      t.timestamps
    end
  end
end
