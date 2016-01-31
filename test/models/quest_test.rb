# == Schema Information
#
# Table name: quests
#
#  id         :integer          not null, primary key
#  name       :text
#  person     :text
#  location   :text
#  notes      :text
#  quest_type :string
#  done       :boolean          default(FALSE)
#  have       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class QuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
