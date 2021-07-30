class Note < ActiveRecord::Base
    validates :category, presence: true, inclusion: {in: %w(planting growing harvesting)}
    validates :content, presence: true

    belongs_to :plant
end