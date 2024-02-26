class AnimalService
  def conn
    Faraday.new(url: 'https://api.api-ninjas.com') do |faraday|
      faraday.headers['X-Api-Key'] = Rails.application.credentials.api_ninjas[:key]
    end
    require "pry"; binding.pry
  end
  
  def get_url(url)
    require "pry"; binding.pry
    response = conn.get(url) 
    
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def animal(q)
    require "pry"; binding.pry
    # get_url("/v1/animals?name=#{q}")
    get_url("api/v1/animals?name=#{q}")
  end
end