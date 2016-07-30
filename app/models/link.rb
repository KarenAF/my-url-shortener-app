class Link < ActiveRecord::Base
  belongs_to :user
  has_many :visits

  validates :slug, presence: true
  validates :slug, uniqueness: true
  validates :target_url, presence: true
  
end
