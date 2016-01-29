json.array!(@quests) do |quest|
  json.extract! quest, :id, :name, :person, :location, :notes
  json.url quest_url(quest, format: :json)
end
