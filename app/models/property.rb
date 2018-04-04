class Property < ApplicationRecord
  # TIPS 最寄り駅を初回入力時と同一の並び順に保証するためラムダ式 -> {order("number ASC")}
  has_many :nearest_stations , -> {order("number ASC")} , inverse_of: :property
  accepts_nested_attributes_for :nearest_stations
end
