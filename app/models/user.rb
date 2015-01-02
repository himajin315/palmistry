class User < ActiveRecord::Base
  belongs_to :marry
  belongs_to :palm
  validates :uname, length: { maximum: 50 } ,presence: true
end
