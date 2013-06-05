class GeoJSON
  def self.build(photo)
     { type: 'Feature',
    properties: {
                  title: photo.username,
                  url: photo.url,
                  description: photo.text,
                  'marker-color'=> '#543511',
                  'marker-size'=> 'small'

                },
    geometry: {
                type: 'Point',
                coordinates: [photo.location.x, photo.location.y]
              }
    }
  end
end
