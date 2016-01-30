module QuestsHelper

  def quest_states
    [
      ['Hide Complete', 'success'],
      ['Hide Current', 'info'],
      ['Hide New', 'default']
    ]
  end

  def set_quest_class(quest)
    klass = ['quest']
    if quest.done
      klass << 'success'
    elsif quest.have
      klass << 'info'
    else
      klass << 'default'
    end
    if quest.white_march?
      klass << 'white-march'
    end
    klass.join(' ')
  end
end
