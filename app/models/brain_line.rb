  class BrainLine
    def initialize(user)
      @user = user
      @sex_human = user.sex_human
    end

    def result_think
      case @user.palm.brain_think
      when 0 then
        I18n.t('models.brain_line.think.left', uname: @user.uname)
      when 1 then
        I18n.t('models.brain_line.think.right', uname: @user.uname)
      when 2 then
        I18n.t('models.brain_line.think.average', uname: @user.uname)
      when 3 then
        I18n.t('models.brain_line.think.intuition', uname: @user.uname)
      when 4 then
        I18n.t('models.brain_line.think.strange', uname: @user.uname)
      end
    end

    def result_life
      case @user.palm.brain_life
      when 0 then
        I18n.t('models.brain_line.life.common', uname: @user.uname)
      when 1 then
        I18n.t('models.brain_line.life.prudent', uname: @user.uname)
      when 2 then
        I18n.t('models.brain_line.life.active', uname: @user.uname)
      when 3 then
        I18n.t('models.brain_line.life.doubt', uname: @user.uname)
      end
    end

    def result_genius
      if @user.palm.brain_genius then
        I18n.t('models.brain_line.genius', uname: @user.uname)
      else
        nil
      end
    end

    def result_hardworker
      if @user.palm.brain_hardworker then
        I18n.t('models.brain_line.hardworker', uname: @user.uname)
      else
        nil
      end
    end

    def result_many_skill
      if @user.palm.brain_many_skill then
        I18n.t('models.brain_line.many_skill', uname: @user.uname)
      else
        nil
      end
    end

    def result_speed_think
      if @user.palm.brain_speed_think then
        I18n.t('models.brain_line.speed_think', uname: @user.uname)
      else
        nil
      end
    end

    def result_indecision
      if @user.palm.brain_indecision then
        I18n.t('models.brain_line.indecision', uname: @user.uname)
      else
        nil
      end
    end
  end
