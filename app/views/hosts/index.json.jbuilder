json.hosts @hosts do |host|
  json.id host.id
  json.name host.name
  json.url host.url
  json.available host.available?
end
