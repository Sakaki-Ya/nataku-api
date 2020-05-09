class Post < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :content, PostImageUploader

    validates :type, format: { with: /\Aimage|text\z/,
        message: "The type can be either 'image' or 'text'." }
    validates :content, presence: true
end
