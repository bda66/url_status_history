class StatusHistoryController < ApplicationController
  RECORDS_SIZE = 10.freeze

  def index
    @host = Host.find(params["host_id"])
    @host_status_histories = @host.hosts_status_histories.limit(RECORDS_SIZE)
  end
end
