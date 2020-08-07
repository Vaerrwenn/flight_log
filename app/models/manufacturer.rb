class Manufacturer < ApplicationRecord
    has_many :aircrafts, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3 }
end
