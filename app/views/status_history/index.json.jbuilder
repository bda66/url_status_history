json.host_status_history @host_status_histories do |host_status_history|
  json.status host_status_history.status
  json.down_at host_status_history.created_at.strftime("%d.%m.%Y - %H:%M:%S")
  json.up_at host_status_history.updated_at.strftime("%d.%m.%Y - %H:%M:%S") if host_status_history.closed?
end
