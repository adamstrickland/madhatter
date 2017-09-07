class Friend < ApplicationRecord
  has_attached_file :avatar, styles: { square: '200x200#' }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
