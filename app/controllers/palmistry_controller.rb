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
      @feeling_happy = feeling_line.result_happy(feeling_other)
      @feeling_many_love = feeling_line.result_many_love(feeling_other)
      @feeling_slow = feeling_line.result_slow(feeling_other)
    end

    life_line = LifeLine.new(@uname,@sex_human)
    @life_power = life_line.result_power(params[:life])
    @life_live = life_line.result_live(params[:life_other])

    brain_line = BrainLine.new(@uname,@sex_human)
    @brain_think = brain_line.result_think(params[:brain])
    @brain_life = brain_line.result_life(params[:brain_life])
    brain_other = params[:brain_other]
    if brain_other.present? then
      @brain_genius = brain_line.result_genius(brain_other)
      @brain_hardworker = brain_line.result_hardwordker(brain_other)
      @brain_many_skill = brain_line.result_many_skill(brain_other)
      @brain_speed_think = brain_line.result_speed_think(brain_other)
      @brain_indecision = brain_line.result_indecision(brain_other)
    end

    jupiter_line = JupiterLine.new(@uname,@sex_human)
    jupiter = params[:jupiter]
    if jupiter.present? then
      @jupiter_social = jupiter_line.result_social(jupiter)
      @jupiter_reader = jupiter_line.result_reader(jupiter)
    end

    sun_line = SunLine.new(@uname,@sex_human)
    if params[:sun] == '2' then
      @sun_skill_until = sun_line.result_skill(params[:sun])
    else
      @sun_skill = sun_line.result_skill(params[:sun])
    end
    sun_other = params[:sun_other]
    if sun_other.present? then
      @sun_charm = sun_line.result_charm(sun_other)
    end

    mercury_line = MercuryLine.new(@uname,@sex_human)
    @mercury_money = mercury_line.result_money(params[:mercury])

    venus_line = VenusLine.new(@uname,@sex_human)
    venus = params[:venus]
    if venus.present? then
      @venus_virtuous = venus_line.result_virtuous(venus)
      @venus_kind_heart = venus_line.result_kind_heart(venus)
    end

    moon_line = MoonLine.new(@uname,@sex_human)
    moon = params[:moon]
    if moon.present? then
      @moon_like = moon_line.result_like(moon)
      @moon_fatigue = moon_line.result_fatigue(moon)
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
