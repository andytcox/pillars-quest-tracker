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

class Quest < ActiveRecord::Base

  scope :done, -> { where(:done => true) }
  scope :current, -> { where(:have => true) }
  scope :unstarted, -> { where(:done => false, :have => false) }
  scope :white_march, -> { where("name ILIKE ?", "%[WM1]%") }

  # Determine if its a quest for white march
  def white_march_part_1?
    name.include?('[WM1]')
  end

  def self.pluck_to_hash(*keys)
    pluck(*keys).map{|pa| Hash[keys.zip(pa)] }
  end
end
