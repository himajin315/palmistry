class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @uname = params[:uname]
    @sex = params[:sex]
    user = User.create(uname: params[:uname], sex: params[:sex])

    marriageable_age = params[:marriageable]
    @marriageable = ""
    if marriageable_age then
      marriageable_age.each_with_index do |select_num,i|
        @marriageable += select_num
        if marriageable_age.length-1 != i then
          @marriageable += ", "
        end
      end
      @marriageable += "歳<br>この時期には結婚したいと思う人がいることでしょう。<br> "
    end

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

    illness_line = IllnessLine.new(@uname,@sex_human)
    illness = params[:illness]
    if illness.present? then
      @illness_breath = illness_line.result_breath(illness)
      @illness_blood = illness_line.result_blood(illness)
      @illness_head = illness_line.result_head(illness)
      @illness_eyes = illness_line.result_eyes(illness)
      @illness_stomach = illness_line.result_stomach(illness)
      @illness_liver = illness_line.result_liver(illness)
    end

    hand_shape = HandShape.new(@uname,@sex_human)
    hand = params[:hand_shape]
    if hand.present? then
      if params[:mercury] == '0' then
        @hand_shape_waste = hand_shape.result_waste(hand)
      end
      @hand_shape_report = hand_shape.result_report(hand)
    end

    life_flow_line = LifeFlowLine.new(@uname,@sex_human)
    @life_flow = life_flow_line.result_flow(params[:life_flow])
  end

  def profile
  end
end
