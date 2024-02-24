class AnimalFacade

  def self.animal_search(q)
    service = AnimalService.new
    json = service.animal(q)

    @animals = AnimalPoro.new(json.first) 
  end
end