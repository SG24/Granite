class Attachment < ApplicationRecord
  has_many_attached :avatars
  belongs_to :attachable, polymorphic: true, optional: true
end
