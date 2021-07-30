class Plant < ActiveRecord::Base
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {in: 1..35}
    validates :per_sq_ft, presence: true, numericality: { only_integer: true }
    validates :category, presence: true, inclusion: {in: %w(herb vegetable fruit)}
    validates :days_to_harvest, presence: true

    has_many :notes
end