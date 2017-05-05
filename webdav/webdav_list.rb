require 'net/dav'

url = 'https://webdav.cloud.mail.ru/'
user = 'vishniakov@corp.mail.ru'
pass = 'MyLove18)('

dav = Net::DAV.new(url, :curl => false)
dav.verify_server = false
dav.credentials(user, pass)

# CURL related code
# properties = dav.propfind(url)
# puts properties

dav.find('.',:recursive=>false,:suppress_errors=>false) do | item |
  puts "File: " + item.url.to_s
end
