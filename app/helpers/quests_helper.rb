module QuestsHelper

  def set_quest_class(quest)
    if quest.done
      'success'
    elsif quest.have
      'info'
    else
      'default'
    end
  end
end
