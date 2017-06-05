class Link

  def self.get_recent
    recent_links = LinkService.get_links
    counted_links = {}
    recent_links.map do |link|
      if counted_links.keys.include?(link[:url])
        counted_links[link[:url]] += 1
      else
        counted_links[link[:url]] = 1
      end
    end
    counted_links
  end
end