# How to make Chicken Tracker Service
### Required gems
```ruby
gem 'faraday'
```

### At top of Service
```ruby
def conn
  Faraday.new(url: "https://hidden-sands-71693-380133048218.herokuapp.com") do |faraday|
    faraday.adapter Faraday.default_adapter # Ensure you have this line to set the adapter
  end
end
```

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
# Animals
### Show one Animal
```ruby
response = conn.get("/api/v1/shelters/<SHELTER_ID>/animals/<ANIMALS_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
### Index User's Shelters
```ruby
response = conn.get("/api/v1/shelters/<SHELTER_ID>/<ANIMALS_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
### Create
```ruby
response = conn.post("/api/v1/shelters/<SHELTER_ID>/animals") do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = {"animal": {"name": "<ANIMAL_NAME>", "species": "<ANIMAL_SPECIES>"}}
end
JSON.parse(response.body, symbolize_names: true)
```
### Update
```ruby
response = conn.patch("/api/v1/shelters/<SHELTER_ID>/animals/<ANIMALS_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = {"animal": {"name": "<ANIMAL_NAME>", "species": "<ANIMAL_SPECIES>", "birthday": "<ANIMAL_BIRTHDAY>", "color": "<ANIMAL_COLOR>", "main_prey": "<ANIMAL_MAIN_PREY>", "habitat": "<ANIMAL_HABITAT>", "diet": "<ANIMAL_DIET>", "skin_type": "<ANIMAL_SKIN_TYPE>", "top_speed": "<ANIMAL_TOP_SPEED>", "avg_litter": "<ANIMAL_AVG_LITTER>", "lifespan": "<ANIMAL_LIFESPAN>", "weight": "<ANIMAL_WEIGHT>", "lifestyle": "<ANIMAL_LIFESTYLE>", "fav_food": "<ANIMAL_FAV_FOOD>", "shelter_id": "<ANIMAL_SHELTER_ID>"}}
end
JSON.parse(response.body, symbolize_names: true)
```
NOTE: not all attributes required to Update

### Delete
```ruby
response = conn.delete("/api/v1/shelters/<SHELTER_ID>/animals/<ANIMALS_ID>") do |req|
  req.headers['Content-Type'] = 'application/json'
end
JSON.parse(response.body, symbolize_names: true)
```
