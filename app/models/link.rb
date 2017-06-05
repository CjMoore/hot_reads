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
    sort_links_by_count(counted_links)
  end

  def sort_links_by_count(counted_links)
    counted_links.sort_by { |key, value| value}
  end
end
