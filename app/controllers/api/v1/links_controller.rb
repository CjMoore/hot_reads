class Api::V1::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @link = HotRead.find_by(url: params['url'])
    if @link.nil?
      @new_hot_read =  HotRead.create(url: params['url'], count: 1)
      render status: 201, json: HotRead.get_recent
    else
      new_count = @link.count + 1
      @link.update_attribute(:count, new_count)
      render status: 200, json: HotRead.get_recent
    end
  end

  def index
    @hot_reads = HotRead.get_recent
    render json: @hot_reads
  end
end
