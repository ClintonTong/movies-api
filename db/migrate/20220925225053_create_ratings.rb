class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.boolean :liked
      t.integer :movie_id

      t.timestamps
    end
  end
end
