namespace :task_station do
  desc "最寄り駅追加時、既存データパッチタスク"
  task :patch,[:arg] => :environment do |t, args|

    puts "データパッチ開始"
    puts "#{args[:arg]}枠まで追加します"

    #追加枠まで達していない物件を抽出する
    sql = "select distinct property_id from nearest_stations where property_id not in (select distinct property_id from nearest_stations where number >= #{args[:arg]})"

    count = ActiveRecord::Base.connection.execute(sql).count

    puts "該当物件数：#{count}件"

    # レコード書き込み開始
    ActiveRecord::Base.connection.execute(sql).each do |result|
      2.upto(args[:arg].to_i) do |i|
        new_rec = NearestStation.new(number: i, property_id: result["property_id"])
        puts "追加レコード物件ID:#{result["property_id"]} , 最寄り駅枠番号：#{i}"
        new_rec.save #枠がすでにある場合、falseになるが気にしない。
      end
    end
  end
end
