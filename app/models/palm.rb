class Palm < ActiveRecord::Base
  has_one :user
  validates :feeling_love, length: { maximum: 1 }
  validates :feeling_happy, inclusion: [true, false], allow_blank: true
  validates :feeling_many_love, inclusion: [true, false], allow_blank: true
  validates :feeling_slow, inclusion: [true, false], allow_blank: true
  validates :life_power, length: { maximum: 1 }
  validates :life_live, length: { maximum: 1 }
  validates :brain_think, length: { maximum: 1 }
  validates :brain_life, length: { maximum: 1 }
  validates :brain_genius, inclusion: [true, false], allow_blank: true
  validates :brain_hardworker, inclusion: [true, false], allow_blank: true
  validates :brain_many_skill, inclusion: [true, false], allow_blank: true
  validates :brain_speed_think, inclusion: [true, false], allow_blank: true
  validates :brain_indecision, inclusion: [true, false], allow_blank: true
  validates :jupiter_social, inclusion: [true, false], allow_blank: true
  validates :jupiter_reader, inclusion: [true, false], allow_blank: true
  validates :sun_skill_until, inclusion: [true, false], allow_blank: true
  validates :sun_skill, length: { maximum: 1 }
  validates :sun_charm, inclusion: [true, false], allow_blank: true
  validates :mercury_money, length: { maximum: 1 }
  validates :venus_virtuous, inclusion: [true, false], allow_blank: true
  validates :venus_kind_heart, inclusion: [true, false], allow_blank: true
  validates :moon_like, inclusion: [true, false], allow_blank: true
  validates :moon_fatigue, inclusion: [true, false], allow_blank: true
  validates :illness_breath, inclusion: [true, false], allow_blank: true
  validates :illness_blood, inclusion: [true, false], allow_blank: true
  validates :illness_head, inclusion: [true, false], allow_blank: true
  validates :illness_eyes, inclusion: [true, false], allow_blank: true
  validates :illness_stomach, inclusion: [true, false], allow_blank: true
  validates :illness_liver, inclusion: [true, false], allow_blank: true
  validates :hand_shape_waste, inclusion: [true, false], allow_blank: true
  validates :hand_shape_report, inclusion: [true, false], allow_blank: true
  validates :life_flow, length: { maximum: 1 }
end
