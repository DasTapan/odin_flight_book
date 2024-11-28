class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: 'Airport'
    belongs_to :arrival_airport, class_name: 'Airport'

    scope :searched, ->(dep_id: nil,ari_id: nil, start:nil) {where("
    departure_airport_id = ? AND
    arrival_airport_id = ? AND
    DATE(start) = ?",
    dep_id,ari_id,start
    )}
end
