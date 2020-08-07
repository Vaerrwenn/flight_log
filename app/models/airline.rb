class Airline < ApplicationRecord
    has_many :flights, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3 }
    validates :icao_code, presence: true, length: { minimum: 3, maximum: 3 }
end
