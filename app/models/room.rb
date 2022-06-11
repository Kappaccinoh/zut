class Room < ApplicationRecord
    validates_uniqueness_of :name
    validates :name, presence: true
    
    has_many :messages, dependent: :destroy
    has_many :groupparticipants, dependent: :destroy

    # Not dependent: :destroy, because we already manually destroy those table entries
    # -- Answer Tables --
    has_many :famous_foursomes_category_answers
    
    has_many :gameturns


    belongs_to :user, autosave: true
    
    scope :open_rooms, -> { where(is_active: false) }
    scope :inprogress_rooms, -> { where(is_active: true) }
    after_create_commit { broadcast_append_to "rooms" }
end
