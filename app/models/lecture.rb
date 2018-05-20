class Lecture < ApplicationRecord
    belongs_to:course
    belongs_to:user
    
    acts_as_votable
    mount_uploader :attachment, AttachmentUploader

end
