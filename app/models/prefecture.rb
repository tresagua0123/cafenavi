class Prefecture < ApplicationRecord
    has_many :posts
    validates :name, presence: false
end
