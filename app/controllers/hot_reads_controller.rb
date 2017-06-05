class HotReadsController < ApplicationController

  def index
    @hot_reads = Link.get_recent
    byebug
  end
end
