class CreatePalms < ActiveRecord::Migration
  def change
    create_table :palms do |t|
      t.integer :feeling_love
      t.boolean :feeling_happy
      t.boolean :feeling_many_love
      t.boolean :feeling_slow
      t.integer :life_power
      t.integer :life_live
      t.integer :brain_think
      t.integer :brain_life
      t.boolean :brain_genius
      t.boolean :brain_hardworker
      t.boolean :brain_many_skill
      t.boolean :brain_speed_think
      t.boolean :brain_indecision
      t.boolean :jupiter_social
      t.boolean :jupiter_reader
      t.boolean :sun_skill_until
      t.boolean :sun_skill
      t.boolean :sun_charm
      t.integer :mercury_money
      t.boolean :venus_virtuous
      t.boolean :venus_kind_heart
      t.boolean :moon_like
      t.boolean :moon_fatigue
      t.boolean :illness_breath
      t.boolean :illness_blood
      t.boolean :illness_head
      t.boolean :illness_eyes
      t.boolean :illness_stomach
      t.boolean :illness_liver
      t.boolean :hand_shape_waste
      t.boolean :hand_shape_report
      t.integer :life_flow

      t.timestamps
    end
  end
end
