class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name        #物件名
      t.integer :rent       #賃料
      t.string :address     #住所
      t.integer :age        #年齢
      t.text :note          #備考

      t.timestamps
    end
  end
end
