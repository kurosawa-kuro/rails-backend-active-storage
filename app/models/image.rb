class Image < ApplicationRecord
    has_one_attached :path
    validates :path, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
