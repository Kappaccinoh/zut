class Room < ApplicationRecord
    validates_uniqueness_of :name
    has_many :messages, dependent: :destroy
    has_many :groupparticipants, dependent: :destroy
    has_many :gameturns, dependent: :destroy
    belongs_to :user, autosave: true
    
    scope :open_rooms, -> { where(is_active: false) }
    scope :inprogress_rooms, -> { where(is_active: true) }
    after_create_commit { broadcast_append_to "rooms" }
end
