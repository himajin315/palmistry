class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    @uname = params[:uname]
    @sex = params[:sex]
    user = User.create(uname: params[:uname], sex: params[:sex])
    @sex_human = user.sex_human

    user.marry_age = params[:marriageable]
    @marriageable = ""
    if user.marry_age then
      user.marry_age.each_with_index do |select_num,i|
        @marriageable += select_num
        if user.marry_age.length-1 != i then
          @marriageable += ", "
        end
      end
      @marriageable += "歳<br>この時期には結婚したいと思う人がいることでしょう。<br> "
    end

    palm_info_insert(user);
    
    feeling_line = FeelingLine.new(user)
    @feeling_love = feeling_line.result_love
    @feeling_happy = feeling_line.result_happy
    @feeling_many_love = feeling_line.result_many_love
    @feeling_slow = feeling_line.result_slow

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

  private
  def palm_info_insert(user)
    user.palm = Palm.create!({
      feeling_love: params[:feeling],
      life_power: params[:life],
      life_live: params[:life_other],
      brain_think: params[:brain],
      brain_life: params[:brain_life],
      mercury_money: params[:mercury],
      life_flow: params[:life_flow],
      })
    feeling_insert(user);
    brain_insert(user);
    jupiter_insert(user);
    sun_insert(user);
    venus_insert(user);
    moon_insert(user);
    illness_insert(user);
    hand_shape_insert(user);
    user.save
  end

  def feeling_insert(user)
    if params[:feeling_other].present? then
      user.palm.feeling_happy = params[:feeling_other].has_key?("0")
      user.palm.feeling_many_love = params[:feeling_other].has_key?("1")
      user.palm.feeling_slow = params[:feeling_other].has_key?("2")
    end
  end

  def brain_insert(user)
    if params[:brain_other].present? then
      user.palm.brain_genius = params[:brain_other].has_key?("0")
      user.palm.brain_hardworker = params[:brain_other].has_key?("1")
      user.palm.brain_many_skill = params[:brain_other].has_key?("2")
      user.palm.brain_speed_think = params[:brain_other].has_key?("3")
      user.palm.brain_indecision = params[:brain_other].has_key?("4")
    end
  end

  def jupiter_insert(user)
    if params[:jupiter].present? then
      user.palm.jupiter_social = params[:jupiter].has_key?("0")
      user.palm.jupiter_reader = params[:jupiter].has_key?("1")
    end
  end

  def sun_insert(user)
    if params[:sun] == '2' then
      user.palm.sun_skill_until = params[:sun].present?
    else
      user.palm.sun_skill = params[:sun].present?
    end
    if params[:sun_other].present? then
      user.palm.sun_charm = params[:sun_other].has_key?("0")
    end
  end

  def venus_insert(user)
    if params[:venus].present? then
      user.palm.venus_virtuous = params[:venus].has_key?("0")
      user.palm.venus_kind_heart = params[:venus].has_key?("1")
    end
  end

  def moon_insert(user)
    if params[:moon].present? then
      user.palm.moon_like = params[:moon].has_key?("0")
      user.palm.moon_fatigue = params[:moon].has_key?("1")
    end
  end

  def illness_insert(user)
    if params[:illness].present? then
      user.palm.illness_breath = params[:illness].has_key?("0")
      user.palm.illness_blood = params[:illness].has_key?("1")
      user.palm.illness_head = params[:illness].has_key?("2")
      user.palm.illness_eyes = params[:illness].has_key?("3")
      user.palm.illness_stomach = params[:illness].has_key?("4")
      user.palm.illness_liver = params[:illness].has_key?("5")
    end
  end

  def hand_shape_insert(user)
    if params[:hand_shape].present? then
      if params[:mercury] == '0' then
        user.palm.hand_shape_waste = params[:hand_shape].has_key?("0")
      end
      user.palm.hand_shape_report = params[:hand_shape].has_key?("1")
    end
  end
end
