package com.sushant.live.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sushant.live.model.Location;
import com.sushant.live.repository.LocationRepository;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class LocationService {

    @Autowired
    private LocationRepository locationRepository;

    public Location saveLocation(MultipartFile file, String siteName, String address, String facilities, String mapLink) throws IOException {
        Location location = new Location();
        location.setSiteName(siteName);
        location.setAddress(address);
        location.setFacilities(facilities);
        location.setMapLink(mapLink);
        location.setImage(file.getBytes()); // Convert image to byte array (BLOB)

        return locationRepository.save(location);
    }

    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    public Optional<Location> getLocationById(Long id) {
        return locationRepository.findById(id);
    }

    public String getImageBase64(Long id) {
        Optional<Location> location = locationRepository.findById(id);
        return location.map(loc -> Base64.getEncoder().encodeToString(loc.getImage())).orElse(null);
    }
    
    public void deleteLocation(Long id) {
    	locationRepository.deleteById(id);
    }
}
