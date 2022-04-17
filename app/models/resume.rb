class Resume < ApplicationRecord
    belongs_to :user 
    validates :title , presence: true
    validates :content , presence: true

    scope :published, -> { where(status: "published") }
    scope :draft, -> { where(status: "draft") }

   def self.all_status
    [["草稿" , "draft"], ["發布" , "published"]]
   end

end
