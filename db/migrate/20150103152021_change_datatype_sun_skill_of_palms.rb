class ChangeDatatypeSunSkillOfPalms < ActiveRecord::Migration
  def change
    change_column :palms, :sun_skill, :integer
  end
end
