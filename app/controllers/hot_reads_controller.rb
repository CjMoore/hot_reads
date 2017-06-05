class HotReadsController < ApplicationController

  def index
    @hot_reads = HotRead.get_recent
  end
end
