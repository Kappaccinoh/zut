class User < ApplicationRecord
    validates_uniqueness_of :username
    has_many :messages
    has_many :rooms
    has_many :groupparticipants

    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }
end