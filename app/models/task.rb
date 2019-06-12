class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  before_validation :set_nameless_name
  validates :name, presence:true, length:{ maximum:30 }
  validates :description, presence:true, length: { maximum:400 }
  
  private
  
  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
  
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end
  
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
