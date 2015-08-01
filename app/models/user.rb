class User < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :projects, :through => :works

  validates :fname, length: { minimum: 2 }
  validates :lanme, length: { minimum: 5 }
  validates :company_id, presence: true

  def to_s
    "#{fname} #{lname}"
  end
end
