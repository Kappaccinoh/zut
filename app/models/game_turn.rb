class GameTurn < ApplicationRecord
    validates_uniqueness_of :name

    belongs_to :user
    belongs_to :room
end
