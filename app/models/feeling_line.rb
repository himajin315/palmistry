class FeelingLine
  def initialize(user)
    @user = user
    @sex_human = user.sex_human
  end

  def result_love
    case @user.palm.feeling_love
    when 0 then
      I18n.t('models.feeling_line.suddenly', uname: @user.uname)
    when 1 then
      I18n.t('models.feeling_line.calm', uname: @user.uname)
    when 2 then
      I18n.t('models.feeling_line.nagative', uname: @user.uname)
    when 3 then
      I18n.t('models.feeling_line.deep', uname: @user.uname)
    when 4 then
      I18n.t('models.feeling_line.kind', uname: @user.uname)
    when 5 then
      I18n.t('models.feeling_line.easier', uname: @user.uname, sex_human: @sex_human)
    end
  end

  def result_happy
    result = nil
    if @user.palm.feeling_happy then
      result = @user.uname + " さんは人を幸せにする力を持っています。<br>" + @user.uname + " さんの周りの人はとても幸せな気持ちになることでしょう。<br> 結婚するなら" + @user.uname + " さんのような人がすごく良いでしょう。<br>"
  	end
  end

  def result_many_love
    result = nil
    if @user.palm.feeling_many_love then
      result = @user.uname + " さんは数多くの恋愛を経験する人です。<br>
      恋愛の切り替えが早く、失恋してもすぐに次の恋愛に行ける人です。<br>
      好きな人がよく変わる人だと思われやすいですが、切り替えが早いのは良いことです。<br>
      次のチャンスを逃さないためにも、恋愛のチャンスがあるならば飛び込むことも良いことでしょう。<br>"
    end
  end

  def result_slow
    result = nil
    if @user.palm.feeling_slow then
      @love_other_slow =
      @user.uname + " さんはおっとりタイプの性格をしてます。<br>
      周りから天然っぽいと思われていることが多いでしょう。<br>
      ゆっくりマイペースなので、周りからの影響を受けにくいです。<br>
      また、あまり怒りにくい性格でもあります。<br>
      自分のペースを大事にすることが精神衛生上によろしいでしょう。<br>"
    end
  end
end
