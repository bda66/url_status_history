require 'net/http'

module UrlCheck
  module_function

  def check_hosts
    Host.all.each do |host|
      status = get_status_by(host.url)
      if status == '200'
        host_status = host.hosts_status_histories.open.first
        host_status.closed! if host_status
      else
        host.hosts_status_histories.where(status: :open).first_or_create
      end
    end
  end

  def get_status_by(url)
    url = URI.parse(url)
    response = Net::HTTP.get_response(url)
    if response.code == '301'
      response = get_response_with_redirect(URI.parse(r.header['location']))
    end
    response.code
  rescue StandardError => e
    e
  end
end
