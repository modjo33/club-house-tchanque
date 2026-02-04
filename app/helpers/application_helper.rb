module ApplicationHelper
  # Récupère les images pour un emplacement donné
  # Retourne les images dynamiques si elles existent, sinon utilise les fallback
  def site_photos_for(location)
    location_info = SitePhoto.location_info(location)
    return [] unless location_info

    photos = SitePhoto.for_location(location).includes(image_attachment: :blob)

    if photos.any?
      photos.map do |photo|
        {
          url: url_for(photo.image),
          alt: photo.alt_text.presence || location_info[:label]
        }
      end
    else
      # Utiliser les images par défaut
      defaults = location_info[:type] == :single ? [location_info[:default]] : location_info[:defaults]
      (defaults || []).map do |path|
        {
          url: image_path(path),
          alt: location_info[:label]
        }
      end
    end
  end

  # Récupère une seule image (pour les heroes et images uniques)
  def site_photo_for(location)
    site_photos_for(location).first
  end

  def restaurant_json_ld
    {
      "@context": "https://schema.org",
      "@type": "Restaurant",
      "name": "Club House Tchanqué",
      "alternateName": "Restaurant du Golf de Villenave-d'Ornon",
      "description": "Restaurant ouvert à tous au cœur du golf de Villenave d'Ornon. Cuisine maison, produits frais, grande terrasse avec vue panoramique sur le lac.",
      "url": "https://club-house-tchanque.com",
      "telephone": "+33961631527",
      "email": "sasvmrestaurations@gmail.com",
      "image": "https://club-house-tchanque.com/logo/logo-tchanque.jpg",
      "logo": "https://club-house-tchanque.com/logo/logo-tchanque.jpg",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "43 Avenue Mirieu de Labarre",
        "addressLocality": "Villenave-d'Ornon",
        "postalCode": "33140",
        "addressCountry": "FR",
        "addressRegion": "Nouvelle-Aquitaine"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": 44.7636,
        "longitude": -0.5515
      },
      "openingHoursSpecification": [
        {
          "@type": "OpeningHoursSpecification",
          "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
          "opens": "08:00",
          "closes": "19:00"
        }
      ],
      "servesCuisine": "Française",
      "priceRange": "€€",
      "acceptsReservations": "True",
      "paymentAccepted": "Cash, Credit Card",
      "currenciesAccepted": "EUR",
      "sameAs": [
        "https://www.facebook.com/profile.php?id=100063508872441",
        "https://www.instagram.com/clubhousetchanque/",
        "https://www.tripadvisor.fr/Restaurant_Review-g1025628-d13456505-Reviews-Club_House_Tchanque-Villenave_D_ornon_Bordeaux_Gironde_Nouvelle_Aquitaine.html"
      ],
      "hasMenu": [
        {
          "@type": "Menu",
          "name": "La Carte",
          "url": "https://club-house-tchanque.com/la-carte"
        },
        {
          "@type": "Menu",
          "name": "Carte des Vins",
          "url": "https://club-house-tchanque.com/la-carte-des-vins"
        },
        {
          "@type": "Menu",
          "name": "Carte des Boissons",
          "url": "https://club-house-tchanque.com/la-carte-des-boissons"
        }
      ],
      "amenityFeature": [
        {
          "@type": "LocationFeatureSpecification",
          "name": "Terrasse",
          "value": true
        },
        {
          "@type": "LocationFeatureSpecification",
          "name": "Parking gratuit",
          "value": true
        },
        {
          "@type": "LocationFeatureSpecification",
          "name": "Salle privative",
          "value": true
        },
        {
          "@type": "LocationFeatureSpecification",
          "name": "Wifi gratuit",
          "value": true
        },
        {
          "@type": "LocationFeatureSpecification",
          "name": "Vue sur le golf",
          "value": true
        }
      ]
    }.to_json
  end
end
