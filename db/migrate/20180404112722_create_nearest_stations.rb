class CreateNearestStations < ActiveRecord::Migration[5.0]
  def change
    create_table :nearest_stations do |t|
      t.integer :number     #最寄り駅番号
      t.string  :name       #最寄り駅名
      t.string  :rail_way   #路線名
      t.integer  :on_foot   #徒歩でかかる時間
      t.references :property, foreign_key: true   #外部キー 建物
      t.timestamps
    end
  end
end
