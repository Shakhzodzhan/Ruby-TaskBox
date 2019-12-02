class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tag_associations
  has_many :tags, through: :tag_associations

  validates :title, :note, presence: true
# def self.search(search)
#   if search
#     where(["name LIKE ?", "%#{search}%"])
#   else
#     all
#   end
# end

end
