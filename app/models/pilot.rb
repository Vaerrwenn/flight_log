class Pilot < ApplicationRecord
    has_many :flights, dependent: :destroy
    validates :name, presence: true, length: { minimum:2 }
    validates :date_of_birth, presence: true
    validates :gender, presence: true
end
