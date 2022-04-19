class Resume < ApplicationRecord
    extend FriendlyId
    friendly_id :rendom_slug , use: :slugged
    
    belongs_to :user 
    validates :title , presence: true
    validates :content , presence: true

    scope :published, -> { where(status: "published") }
    scope :draft, -> { where(status: "draft") }

   def self.all_status
    [["草稿" , "draft"], ["發布" , "published"]]
   end

   private 
   def rendom_slug 
        [*'0'..'9' , *'a'..'z'].sample(10).join   
    end

end
