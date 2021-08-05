class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/plants/) && req.get?
            id = req.path.split("/plants/").last
            if id.to_i > 0
                plant = [Plant.find(id)].map do |plant|
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
                
                return [200, { 'Content-Type' => 'application/json' }, [ {:plant => plant}.to_json ]]
            end
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

        elsif req.path.match(/gardens/) && req.get?
            id = req.path.split("/gardens/").last
            if id.to_i > 0
                garden = [Garden.find(id)].map do |garden|
                    {
                        id: garden.id, 
                        name: garden.name, 
                        length: garden.length, 
                        width: garden.width, 
                        depth: garden.depth,
                        plots: garden.plots.all.map do |plot|
                            {plant_name: Plant.find(plot.plant_id).name, plant_id: plot.plant_id, garden_id:plot.plant_id, position:plot.position}
                        end
                    }
                end
                
                return [200, { 'Content-Type' => 'application/json' }, [ {:gardens => garden}.to_json ]]
            end

            gardens = Garden.all.map do |garden|
                {
                    id: garden.id, 
                    name: garden.name, 
                    length: garden.length, 
                    width: garden.width, 
                    depth: garden.depth,
            
                    plots: garden.plots.all.map do |plot|
                        {plant: Plant.find(plot.plant_id).name, image:Plant.find(plot.plant_id).icon}
                    end
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ {:gardens => gardens}.to_json ]]
           
        elsif req.path.match(/gardens/) && req.post?

            data = JSON.parse req.body.read
            
            garden = Garden.create(
                name: data["name"], 
                length: data["length"], 
                width: data["width"], 
                depth: data["depth"]
            )
                
            res_garden = {id: garden.id, name: garden.name}
    
            return [200, { 'Content-Type' => 'application/json' }, [ {:garden => res_garden}.to_json ]]  
         
        elsif req.path.match(/gardens/) && req.patch?

            data = JSON.parse req.body.read
            plot = Plot.find_or_create_by(
                garden_id: data["garden_id"], 
                position: data["position"] 
            )

            plot.update(plant_id: data["plant_id"]) 

            res_plot = {id: plot.id, plant_id: plot.plant_id, plant_name: Plant.find(plot.plant_id).name}

            return [200, { 'Content-Type' => 'application/json' }, [ {:plot => res_plot}.to_json ]]  
        end   
    end
end