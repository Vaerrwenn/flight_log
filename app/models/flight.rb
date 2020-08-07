class Flight < ApplicationRecord
  belongs_to :pilot
  belongs_to :airline
  belongs_to :aircraft
  validates :flight_num, presence: true, length: { minimum:6, maximum:8 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :origin, presence: true, length: { minimum:3 }
  validates :destination, presence: true, length: { minimum:3 }
end
