class User < ApplicationRecord
    validates_uniqueness_of :username
    has_many :messages
    has_many :rooms
    has_many :groupparticipants
    has_many :gameturns

    scope :all_except, ->(user) { where.not(id: user) }
    # after_create_commit { broadcast_append_to "users" } not even sure why we need a turbo stream for creating users
end
