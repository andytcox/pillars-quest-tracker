namespace :scrape do
  task :get => :environment do
    agent = Mechanize.new
    page = agent.get("file:///" + Rails.root.join('public', 'pillars.html').to_s)

    binding.pry
  end

  task :start => :environment do
    Quest.destroy_all
    agent = Mechanize.new
    page = agent.get('http://pillarsofeternity.gamepedia.com/Quests')

    dtables = page.search('.wikitable')
    tables = [dtables[0], dtables[2]]
    nodes = []

    tables.each_with_index do |table, index|
      baseUrl = 'http://pillarsofeternity.gamepedia.com'

      rows = table.search('tr')[1..-1]

      rows.each do |row|
        row.search('td').each do |cell|

          # Looks like this isn't needed after all :X
          cell.search('a').each do |anchor|
            anchor.attribute('href').value = baseUrl + anchor.attribute('href').value
          end
        end
        data = tds.collect{|td| td.children.to_s }
        quest_type = (index == 0 ? 'side' : 'main')
        Quest.create(:name => data[0], :person => data[1], :location => data[2], :notes => data[3], :quest_type => quest_type)
      end
    end
  end



  task :local => :environment do
    Quest.destroy_all
    agent = Mechanize.new
    # page = agent.get('http://pillarsofeternity.gamepedia.com/Quests')
    page = agent.get("file:///" + Rails.root.join('public', 'pillars.html').to_s)
    dtables = page.search('.wikitable')
    tables = [dtables[0], dtables[2]]
    nodes = []

    tables.each_with_index do |table, index|
      baseUrl = 'http://pillarsofeternity.gamepedia.com'

      rows = table.search('tr')[1..-1]

      rows.each do |row|
        if row.attribute('class')
          finished = row.attribute('class').value.include?('selected')
          gathered = row.attribute('class').value.include?('c') && !row.attribute('class').value.include?('selected')
        end

        nodes << row
        tds = row.search('td')
        tds.each do |cell|

          # Looks like this isn't needed after all
          cell.search('a').each do |anchor|
            anchor.attribute('href').value = baseUrl + anchor.attribute('href').value
          end
        end
        data = tds.collect{|td| td.children.to_s }
        quest_type = (index == 0 ? 'side' : 'main')
        Quest.create(:name => data[0], :person => data[1], :location => data[2], :notes => data[3], :quest_type => quest_type, :done => finished, :have => gathered)
      end


    end
  end

  task :sanitize_links => :environment do
    Quest.all.each do |quest|
      ['name', 'person', 'location', 'notes'].each do |attr|
        next unless quest[attr]
        quest.update_attribute(attr, quest[attr].gsub('http://pillarsofeternity.gamepedia.comh', 'h'))
      end
    end
  end
end


          # Quest.create(:name => anchors[0], :person => anchors[1], :location => anchors[2], :notes => anchors[3])