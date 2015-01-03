class User < ActiveRecord::Base
  belongs_to :marry
  belongs_to :palm
  validates :uname, length: { maximum: 50 } ,presence: true
  serialize :marry_age

  def sex_human
    sex_human = sex == 0 ? "お父さん":"お母さん"
  end
end
