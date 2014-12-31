class IllnessLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_breath(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = @uname + " さんは呼吸器系が弱っています。<br>
      部屋の空気を綺麗にし、住み良い環境を作るようにして下さい。<br>"
    end
  end

  def result_blood(number_list)
    result = nil
    if number_list.has_key?('1') then
      result = @uname + " さんは循環器系に負担をかけています。<br>
      脂っこい食事や塩分の摂り過ぎには注意してください。<br>"
    end
  end

  def result_head(number_list)
    result = nil
    if number_list.has_key?('2') then
      result = @uname + " さんは注意力が足りないため、事故に合いやすいです。<br>
      疲れがたまってる時の運転など、無理のないよう気をつけて下さい。<br>"
    end
  end

  def result_eyes(number_list)
    result = nil
    if number_list.has_key?('3') then
      result = @uname + " さんは目の疲れが溜まっています。<br>
      視力低下や目の病気になりやすいです。<br>
      目を酷使させすぎないよう休ませるようにして下さい。<br>"
    end
  end

  def result_stomach(number_list)
    result = nil
    if number_list.has_key?('4') then
      result = @uname + " さんは胃や小腸などの消化器官系に負担をかけています。<br>
      おかなを壊しやすい状態なので、食生活の改善が必要です。<br>"
    end
  end

  def result_liver(number_list)
    result = nil
    if number_list.has_key?('5') then
      result = @uname + " さんは腎臓・肝臓に負担をかけています。<br>
      お酒の飲み過ぎには注意してください。たまには休肝日を設けるとよいでしょう。<br>"
    end
  end
end
