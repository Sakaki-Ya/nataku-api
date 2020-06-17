class Post < ApplicationRecord
    belongs_to :user, optional: true
    # mount_uploader :content, PostImageUploader

    validates :content, presence: true
end