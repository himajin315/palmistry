class VenusLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_virtuous(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = "さらに、" + @uname + " さんは周りからの信頼も厚いです。<br>
      自分のことよりも周りへの貢献を優先させるような人です。<br>
      とても素晴らしい人でしょう。<br>"
    end
  end

  def result_kind_heart(number_list)
    result = nil
    if number_list.has_key?('1') then
      result = @uname + " さんは結婚後は子供を大切にします。<br>
      家族のことを優先的に考え、家族を大切にする良い" + @sex_human +"になるタイプでしょう。<br>"
    end
  end
end
