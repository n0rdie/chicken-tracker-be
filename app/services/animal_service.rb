class AnimalService
  def conn
    Faraday.new(url: 'https://api.api-ninjas.com') do |faraday|
      faraday.headers['X-Api-Key'] = Rails.application.credentials.api_ninjas[:key]
    end
  end

  def get_url(url)
    response = conn.get(url) 

    JSON.parse(response.body, symbolize_names: true)
  end

  def animal(q)
    get_url("/v1/animals?name=#{q}")
  end
end