class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]

  def new
  end

  def show
    user = User.find(params[:id]) if params[:id]
    @uname = user.uname
    @marriageable = Marriagable.new(user).result_marry_age

    feeling_line = FeelingLine.new(user)
    @feeling_love = feeling_line.result_love
    @feeling_happy = feeling_line.result_happy
    @feeling_many_love = feeling_line.result_many_love
    @feeling_slow = feeling_line.result_slow

    life_line = LifeLine.new(user)
    @life_power = life_line.result_power
    @life_live = life_line.result_live

    brain_line = BrainLine.new(user)
    @brain_think = brain_line.result_think
    @brain_life = brain_line.result_life
    @brain_genius = brain_line.result_genius
    @brain_hardworker = brain_line.result_hardworker
    @brain_many_skill = brain_line.result_many_skill
    @brain_speed_think = brain_line.result_speed_think
    @brain_indecision = brain_line.result_indecision

    jupiter_line = JupiterLine.new(user)
    @jupiter_social = jupiter_line.result_social
    @jupiter_reader = jupiter_line.result_reader

    sun_line = SunLine.new(user)
    @sun_skill_until = sun_line.result_skill_until
    @sun_skill = sun_line.result_skill
    @sun_charm = sun_line.result_charm

    mercury_line = MercuryLine.new(user)
    @mercury_money = mercury_line.result_money

    venus_line = VenusLine.new(user)
    @venus_virtuous = venus_line.result_virtuous
    @venus_kind_heart = venus_line.result_kind_heart

    moon_line = MoonLine.new(user)
    @moon_like = moon_line.result_like
    @moon_fatigue = moon_line.result_fatigue

    illness_line = IllnessLine.new(user)
    @illness_breath = illness_line.result_breath
    @illness_blood = illness_line.result_blood
    @illness_head = illness_line.result_head
    @illness_eyes = illness_line.result_eyes
    @illness_stomach = illness_line.result_stomach
    @illness_liver = illness_line.result_liver

    hand_shape = HandShape.new(user)
    @hand_shape_waste = hand_shape.result_waste
    @hand_shape_report = hand_shape.result_report

    life_flow_line = LifeFlowLine.new(user)
    @life_flow = life_flow_line.result_flow
  end

  def create
    @user = User.create(uname: params[:uname], sex: params[:sex], marry_age: params[:marriageable])
    palm_info_insert(@user);

    respond_to do |format|
      if @user.save!
        format.html { redirect_to palmistry_path, notice: 'Micropost was successfully created.' }
        format.json { render action: 'show', status: :created, location: palmistry_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
      user.palm.sun_skill_until = true
    else
      user.palm.sun_skill = params[:sun]
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
