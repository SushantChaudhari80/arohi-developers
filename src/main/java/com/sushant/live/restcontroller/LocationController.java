package com.sushant.live.restcontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import com.sushant.live.model.Location;
import com.sushant.live.service.LocationService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/location")
@CrossOrigin(origins = "*")
public class LocationController {

    @Autowired
    private LocationService locationService;

    @PostMapping("/save")
    public String saveLocation(
            @RequestParam("locationImg") MultipartFile file,
            @RequestParam("siteName") String siteName,
            @RequestParam("address") String address,
            @RequestParam("facilities") String facilities,
            @RequestParam("mapLink") String mapLink) {

        try {
            Location savedLocation = locationService.saveLocation(file, siteName, address, facilities, mapLink);
            return "Location saved successfully with ID: " + savedLocation.getId();
        } catch (IOException e) {
            return "Error saving location: " + e.getMessage();
        }
    }

    @GetMapping("/all")
    public List<Location> getAllLocations() {
        return locationService.getAllLocations();
    }

    @GetMapping("/{id}")
    public Optional<Location> getLocationById(@PathVariable String id) {
    	Long id1 = Long.parseLong(id);
        return locationService.getLocationById(id1);
    }

    @GetMapping("/image/{id}")
    public Map<String, String> getImage(@PathVariable Long id) {
        String base64Image = locationService.getImageBase64(id);
        Map<String, String> response = new HashMap<>();
        response.put("image", base64Image);
        return response;
    }
    
    @GetMapping("/locations")
    public String getAllLocations(Model model) {
        List<Location> locations = locationService.getAllLocations();
        model.addAttribute("locations", locations);
        return "locations"; // This will map to locations.jsp
    }
    
    @DeleteMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
    	locationService.deleteLocation(id);
        return "Location deleted successfully!";
    }

    
}

