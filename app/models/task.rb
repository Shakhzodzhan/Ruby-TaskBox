class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tag_associations
  has_many :tags, through: :tag_associations

  validates :title, :note, presence: true

  searchkick word_start: [:title, :note]

  def search_data
    {
        title: title,
        note: note,
        category: category,
        tags: tags
    }
  end

# def self.search(search)
#   if search
#     where(["name LIKE ?", "%#{search}%"])
#   else
#     all
#   end
# end

end
