class VenusLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_virtuous
    result = nil
    if @user.palm.venus_virtuous then
      result = "さらに、" + @user.uname + " さんは周りからの信頼も厚いです。<br>
      自分のことよりも周りへの貢献を優先させるような人です。<br>
      とても素晴らしい人でしょう。<br>"
    end
  end

  def result_kind_heart
    result = nil
    if @user.palm.venus_kind_heart then
      result = @user.uname + " さんは結婚後は子供を大切にします。<br>
      家族のことを優先的に考え、家族を大切にする良い" + @sex_human +"になるタイプでしょう。<br>"
    end
  end
end
