class SunLine
  def initialize(uname,sex_human)
    @uname = uname
    @sex_human = sex_human
  end

  def result_skill(select_num)
    case select_num
    when '0' then
      result = @uname + " さんは地道な努力で出世するタイプです。<br>
      「継続は力なり」がピッタリな人です。<br>
      続けることで周りから認められる存在となります。<br>
      うまくいなかいからと言ってすぐに諦めるのではなく、根気よく続けていくことが大事になってきます。<br>
      そうすることで、地位や名声を得られることでしょう。<br>"
    when '1' then
      result = @uname + " さんは才能を活かして出世するタイプです。<br>
      自分の才能を活かせる場にいるかどうかで、出世ができるかどうかが決まってきます。<br>
      職業や場所がとても重要な要素でしょう。<br>
      自分のやりたいこととできることは違います。<br>
      やりたいことも大事ですが、才能にあった場所を見つけることも大事です。<br>
      " + @uname + " さんを必要としている場所に行くことでお金には困らない生活をすることでしょう。<br>"
    when '2' then
      result = "ただ、" + @uname + " さんは現在才能を活かしきれていません。<br>
      今やりたいことはありますか。<br>
      " + @uname + " さんの才能に合ったことがうまくできていません。<br>
      今やっていること辞めろってわけではありません。<br>
      今やっていることに" + @uname + " さんの才能を活かすことが必要になってきます。<br>"
    end
  end

  def result_charm(number_list)
    result = nil
    if number_list.has_key?('0') then
      result = @uname + " さんは魅力的な人でもあります。<br>
      異性から好かれやすいようです。<br>
      所謂、モテる人でしょう。<br>"
    end
  end
end
