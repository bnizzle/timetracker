class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, :through => :works

  validates :name, presence: true, length: { minimum: 5 }
  validates :company_id, presence: true
  validates :default_rate, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than: 10000 }
  validates :slug, uniqueness: true, length: { minimum: 3 }

  scope :lowdefaultrate, -> { where("default_rate < 100")}

  def to_s
    "#{name} (#{company})"
  end
end
