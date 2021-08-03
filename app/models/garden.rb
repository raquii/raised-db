class Garden < ActiveRecord::Base
    validates :name, presence: true, length: {in: 3..100}
    validates :length, presence: true, inclusion: { in: 5..100,
        message: "%{value} is not a valid length" }
    validates :width, presence: true, inclusion: { in: 5..100,
        message: "%{value} is not a valid width" }
    validates :depth, presence: true, inclusion: { in: 5..30,
        message: "%{value} is not a valid depth" }
    validates :hardiness_zone, length: { in: 1..3,
        message: "%{value} is not a valid zone" }

    has_many :plants, through: :plots
    has_many :plots
end