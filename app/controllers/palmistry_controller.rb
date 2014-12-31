class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @uname = params[:uname]
    @sex = params[:sex]
    @sex_human = sex = 0 ? "お父さん":"お母さん"

    marriageable_age = params[:marriageable]
    @marriageable = ""
    if marriageable_age then
      marriageable_age.each_with_index do |select_num,i|
        @marriageable += select_num
        if marriageable_age.length-1 != i then
          @marriageable += ", "
        end
      end
    end
    @marriageable += "歳<br>この時期には結婚したいと思う人がいることでしょう。<br> "

    feeling_line = FeelingLine.new(@uname,@sex_human)
    @feeling_love = feeling_line.result_love(params[:feeling])
    feeling_other = params[:feeling_other]
    if feeling_other.present? then
      @feeling_happy = feeling_line.resulet_happy(feeling_other)
      @feeling_many_love = feeling_line.resulet_many_love(feeling_other)
      @feeling_slow = feeling_line.resulet_slow(feeling_other)
    end

    life_line = LifeLine.new(@uname,@sex_human)
    @life_power = life_line.result_power(params[:life])
    @life_live = life_line.result_live(params[:life_other])

    brain_line = BrainLine.new(@uname,@sex_human)
    @brain_think = brain_line.result_think(params[:brain])
    @brain_life = brain_line.result_life(params[:brain_life])
    brain_other = params[:brain_other]
    if brain_other.present? then
      @brain_genius = brain_line.resulet_genius(brain_other)
      @brain_hardworker = brain_line.resulet_hardwordker(brain_other)
      @brain_many_skill = brain_line.result_many_skill(brain_other)
      @brain_speed_think = brain_line.result_speed_think(brain_other)
      @brain_indecision = brain_line.result_indecision(brain_other)
    end

    jupiter = params[:jupiter]
    if jupiter then
      jupiter.keys.each do |select_num|
        case select_num
        when '0' then
          @jupiter_social = "さらに" + @uname + " さんは社会的に成功したいと思っている人です。<br>
          仕事に対して真面目で、一生懸命に頑張ることができます。<br>"
        when '1' then
          @jupiter_reader = "さらに" + @uname + " さんはリーダータイプでもあります。<br>
          誰かに指示されて動くよりも、自分から周りを引っ張っていく方が良いでしょう。<br>"
        end
      end
    end

    case params[:sun]
    when '0' then
      @sun = @uname + " さんは地道な努力で出世するタイプです。<br>
      「継続は力なり」がピッタリな人です。<br>
      続けることで周りから認められる存在となります。<br>
      うまくいなかいからと言ってすぐに諦めるのではなく、根気よく続けていくことが大事になってきます。<br>
      そうすることで、地位や名声を得られることでしょう。<br>"
    when '1' then
      @sun = @uname + " さんは才能を活かして出世するタイプです。<br>
      自分の才能を活かせる場にいるかどうかで、出世ができるかどうかが決まってきます。<br>
      職業や場所がとても重要な要素でしょう。<br>
      自分のやりたいこととできることは違います。<br>
      やりたいことも大事ですが、才能にあった場所を見つけることも大事です。<br>
      " + @uname + " さんを必要としている場所に行くことでお金には困らない生活をすることでしょう。<br>"
    when '2' then
      @sun_not = "ただ、" + @uname + " さんは現在才能を活かしきれていません。<br>
      今やりたいことはありますか。<br>
      " + @uname + " さんの才能に合ったことがうまくできていません。<br>
      今やっていること辞めろってわけではありません。<br>
      今やっていることに" + @uname + " さんの才能を活かすことが必要になってきます。<br>"
    end

    sun_other = params[:sun_other]
    if sun_other then
      sun_other.keys.each do |select_num|
        case select_num
        when '0' then
          @sun_other_charm = @uname + " さんは魅力的な人でもあります。<br>
          異性から好かれやすいようです。<br>
          所謂、モテる人でしょう。<br>"
        end
      end
    end

    case params[:mercury]
    when '0' then
      @mercury = @uname + " さんは現在お金に困っています。<br>
      現在の収入に満足していません。<br>"
    when '1' then
      @mercury = @uname + " さんはお金は入ってきますが、すぐに出て行く状態です。<br>
      貯金がしにくい状態のようです。<br>"
    when '2' then
      @mercury = @uname + " さんはお金には困らない生活をしています。<br>
      特にお金に困るようなこともなく、お金に縛られない生活ができています。<br>"
    end

    venus = params[:venus]
    if venus then
      venus.keys.each do |select_num|
        case select_num
        when '0' then
          @venus_virtuous = "さらに、" + @uname + " さんは周りからの信頼も厚いです。<br>
          自分のことよりも周りへの貢献を優先させるような人です。<br>
          とても素晴らしい人でしょう。<br>"
        when '1' then
          @venus_kindheart =  @uname + " さんは結婚後は子供を大切にします。<br>
          家族のことを優先的に考え、家族を大切にする良い" + @sex_human +"になるタイプでしょう。<br>"
        end
      end
    end

    moon = params[:moon]
    if moon then
      moon.keys.each do |select_num|
        case select_num
        when '0' then
          @moon_like = "さらに、" + @uname + " さんは好かれやすい人でもあります。<br>
          接客業や営業など人と接することが多い仕事に就くのもよいでしょう。<br>"
        when '1' then
          @moon_fatigue =  @uname + " さんは現在疲れがたまっているます。<br>
          休める時にはちゃんと休むようにして下さい。<br>"
        end
      end
    end

    illness = params[:illness]
    if illness then
      illness.keys.each do |select_num|
        case select_num
        when '0' then
          @illness_breath = @uname + " さんは呼吸器系が弱っています。<br>
          部屋の空気を綺麗にし、住み良い環境を作るようにして下さい。<br>"
        when '1' then
          @illness_blood =  @uname + " さんは循環器系に負担をかけています。<br>
          脂っこい食事や塩分の摂り過ぎには注意してください。<br>"
        when '2' then
          @illness_head =  @uname + " さんは注意力が足りないため、事故に合いやすいです。<br>
          疲れがたまってる時の運転など、無理のないよう気をつけて下さい。<br>"
        when '3' then
          @illness_eyes =  @uname + " さんは目の疲れが溜まっています。<br>
          視力低下や目の病気になりやすいです。<br>
          目を酷使させすぎないよう休ませるようにして下さい。<br>"
        when '4' then
          @illness_stomach =  @uname + " さんは胃や小腸などの消化器官系に負担をかけています。<br>
          おかなを壊しやすい状態なので、食生活の改善が必要です。<br>"
        when '5' then
          @illness_liver =  @uname + " さんは腎臓・肝臓に負担をかけています。<br>
          お酒の飲み過ぎには注意してください。たまには休肝日を設けるとよいでしょう。<br>"
        end
      end
    end

    hand_shape = params[:hand_shape]
    if hand_shape then
      hand_shape.keys.each do |select_num|
        case select_num
        when '0' then
          if params[:mercury] == '0' then
            @hand_shape_waste = "ただ、" + @uname + " さんは浪費家です。<br>
            入った分だけ使ってしまうので、いくらお金があっても満足はしません。<br>"
          end
        when '1' then
          @hand_shape_report = "さらに、" + @uname + " さんは文章で伝える能力が高いです。<br>
          自分の考えを伝える時は文章にまとめて伝える方が良いでしょう。<br>"
        end
      end
    end

    @life_flow = params[:life_flow]
    case params[:life_flow]
    when '0' then
      @life_flow = @uname + " さんは家族からの支援がある人です。<br>
      困っている時や悩んでいる時は家族に相談することで解決することができるでしょう。<br>
      なので、家族を大切にしましょう。<br>"
    when '1' then
      @life_flow = @uname + " さんは周りからの支援があるラッキーな人生です。<br>
      困っている時や悩んでいる時は周りに相談することで解決することができるでしょう。<br>"
    when '2' then
      @life_flow = @uname + "さんは自分の道は自分で切り拓く人生を歩みます。<br>
      困っている時や悩んでいる時は可能な限り自分で決断するようにして下さい。<br>
      辛い時は周りに相談するとがあるかと思います。<br>
      相手の意見をそのまま取り入れるのではなく、自分の中で一度整理をし、決断をして下さい。<br>
      周りに流されないよう気をつけて下さい<br>"
    end
  end

  def profile
  end
end
