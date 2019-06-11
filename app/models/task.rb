class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence:true, length:{ maximum:30 }
  validates :description, presence:true, length: { maximum:400 }
  
  private
  
  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end
