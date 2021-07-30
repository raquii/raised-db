class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/plants/) && req.get?
            plants = Plant.all.map do |plant|
                {
                    id: plant.id, 
                    name: plant.name, 
                    per_sq_ft: plant.per_sq_ft, 
                    days_to_harvest: plant.days_to_harvest, 
                    planting_dates: plant.planting_dates,
                    icon: plant.icon,
                    category: plant.category,
                    notes: plant.notes.all.map do |note|
                        {type: note.category, content:note.content}
                    end
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ {:plants => plants}.to_json ]]

        elsif req.path.match(/plants/) && req.post?

            data = JSON.parse req.body.read
            plant = Plant.create(
                name: data["name"], 
                per_sq_ft: data["sqFt"], 
                days_to_harvest: data["daysToHarvest"], 
                planting_dates: data["plantingDates"],
                icon: data["icon"],
                category: data["category"]
            )
            p_note = Note.create(category: "planting", content: data["plantingNotes"], plant_id: plant.id)
            g_note = Note.create(category: "growing", content: data["growingNotes"], plant_id: plant.id)
            h_note = Note.create(category: "harvesting", content: data["harvestingNotes"], plant_id: plant.id)
                  
            res_plant = {id: plant.id, name: plant.name, category: plant.category}
      
            return [200, { 'Content-Type' => 'application/json' }, [ {:plant => res_plant}.to_json ]]  
        end   
    end
end