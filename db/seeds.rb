require "httparty"

def fetch_all(url)
  results = []
  next_url = url
  while next_url
    response = HTTParty.get(next_url)
    data = JSON.parse(response.body)
    results += data["results"]
    next_url = data["next"]
    sleep(0.3)
  end
  results
end

def extract_id(url)
  url.to_s.split("/").reject(&:empty?).last.to_i
end

puts "Seeding Planets..."
planet_map = {}
fetch_all("https://swapi.dev/api/planets/").each do |p|
  record = Planet.find_or_create_by(name: p["name"]) do |pl|
    pl.climate         = p["climate"]
    pl.terrain         = p["terrain"]
    pl.population      = p["population"]
    pl.diameter        = p["diameter"]
    pl.rotation_period = p["rotation_period"]
    pl.orbital_period  = p["orbital_period"]
    pl.gravity         = p["gravity"]
    pl.surface_water   = p["surface_water"]
  end
  planet_map[extract_id(p["url"])] = record.id
end
puts "  #{Planet.count} planets created."

puts "Seeding Species..."
species_map = {}
fetch_all("https://swapi.dev/api/species/").each do |s|
  record = Species.find_or_create_by(name: s["name"]) do |sp|
    sp.classification   = s["classification"]
    sp.designation      = s["designation"]
    sp.language         = s["language"]
    sp.average_height   = s["average_height"]
    sp.average_lifespan = s["average_lifespan"]
    sp.eye_colors       = s["eye_colors"]
    sp.hair_colors      = s["hair_colors"]
    sp.skin_colors      = s["skin_colors"]
  end
  species_map[extract_id(s["url"])] = record.id
end
puts "  #{Species.count} species created."

puts "Seeding Starships..."
starship_map = {}
fetch_all("https://swapi.dev/api/starships/").each do |s|
  record = Starship.find_or_create_by(name: s["name"]) do |st|
    st.model             = s["model"]
    st.starship_class    = s["starship_class"]
    st.manufacturer      = s["manufacturer"]
    st.cost_in_credits   = s["cost_in_credits"]
    st.length            = s["length"]
    st.crew              = s["crew"]
    st.passengers        = s["passengers"]
    st.hyperdrive_rating = s["hyperdrive_rating"]
    st.mglt              = s["MGLT"]
    st.cargo_capacity    = s["cargo_capacity"]
    st.consumables       = s["consumables"]
  end
  starship_map[extract_id(s["url"])] = record.id
end
puts "  #{Starship.count} starships created."

puts "Seeding People..."
person_map = {}
fetch_all("https://swapi.dev/api/people/").each do |p|
  hw_id = extract_id(p["homeworld"].to_s)
  sp_id = p["species"].any? ? extract_id(p["species"].first.to_s) : nil

  record = Person.find_or_create_by(name: p["name"]) do |per|
    per.birth_year  = p["birth_year"]
    per.gender      = p["gender"].presence || "unknown"
    per.height      = p["height"]
    per.mass        = p["mass"]
    per.hair_color  = p["hair_color"]
    per.eye_color   = p["eye_color"]
    per.skin_color  = p["skin_color"]
    per.planet_id   = planet_map[hw_id]
    per.species_id  = sp_id ? species_map[sp_id] : nil
  end
  person_map[extract_id(p["url"])] = record.id
end
puts "  #{Person.count} people created."

puts "Seeding Films and associations..."
fetch_all("https://swapi.dev/api/films/").each do |f|
  film = Film.find_or_create_by(title: f["title"]) do |fl|
    fl.episode_id    = f["episode_id"]
    fl.director      = f["director"]
    fl.producer      = f["producer"]
    fl.release_date  = f["release_date"]
    fl.opening_crawl = f["opening_crawl"]
  end

  f["characters"].each do |url|
    pid = person_map[extract_id(url)]
    FilmCharacter.find_or_create_by(film: film, person_id: pid) if pid
  end

  f["starships"].each do |url|
    sid = starship_map[extract_id(url)]
    FilmStarship.find_or_create_by(film: film, starship_id: sid) if sid
  end
end
puts "  #{Film.count} films created."
puts "  #{FilmCharacter.count} character links created."
puts "  #{FilmStarship.count} starship links created."

total = Planet.count + Species.count + Starship.count + Person.count +
        Film.count + FilmCharacter.count + FilmStarship.count
puts ""
puts "Total rows: #{total}"
puts "Seeding complete." 