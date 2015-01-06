class User < ActiveRecord::Base
  belongs_to :marry
  belongs_to :palm
  validates :uname, length: { maximum: 15 } ,presence: true
  validates :twitter_link, length: { maximum: 400 }
  serialize :marry_age

  validates_uniqueness_of :access_token
  validates_presence_of :access_token
  after_initialize :set_access_token

  def sex_human
    sex_human = sex == 0 ? "お父さん":"お母さん"
  end

  private
  def set_access_token
    self.access_token = self.access_token.blank? ? generate_access_token : self.access_token
  end

  def generate_access_token
    tmp_token = SecureRandom.urlsafe_base64(6)
    self.class.where(:access_token => tmp_token).blank? ? tmp_token : generate_access_token
  end
end
