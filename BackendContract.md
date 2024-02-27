# https://hidden-sands-71693-380133048218.herokuapp.com

# Shelters
### Show one Shelter
```ruby
response = conn.get("/api/v1/shelters/<SHELTER_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
### Index User's Shelters
```ruby
response = conn.get("/api/v1/shelters?user_id=<USER_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
### Create
```ruby
response = conn.post("/api/v1/shelters") do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = {"shelter": {"name": "<SHELTER_NAME>", "user_id": "<USER_ID>"}}
end
JSON.parse(response.body, symbolize_names: true)
```
### Update
```ruby
response = conn.patch("/api/v1/shelters/<SHELTER_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = {"shelter": {"name": "<SHELTER_NAME>", "user_id": "<USER_ID>"}}
end
JSON.parse(response.body, symbolize_names: true)
```
### Delete
```ruby
response = conn.delete("/api/v1/shelters/<SHELTER_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
