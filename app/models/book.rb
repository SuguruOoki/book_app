class Book < ActiveRecord::Base
  scope :costly, -> {where("price > ?",3000)}
  scope :written_about, -> {where("name like ?","%{theme}%")}
  default_scope -> {order("published_on desc")}
  belongs_to :publisher
  has_many :book_auhthors
  has_many :authors, through: :book_auhthors
  validates :name, length: {maximum: 15}
  validates :name, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
