class Aircraft < ApplicationRecord
  belongs_to :manufacturer
  has_many :flights, dependent: :destroy
  validates :registration, presence: true, length: { minimum: 3, maximum: 6 }
  validates :model, presence: true, length: { minimum: 3 }
end
