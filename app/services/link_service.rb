class LinkService

  def self.get_links
    JSON.parse((HTTParty.get('https://shrouded-plateau-67325.herokuapp.com/api/v1/recent_links')).body, symbolize_names: true)
  end
end
