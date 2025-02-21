package com.sushant.live.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sushant.live.model.Project;
import com.sushant.live.repository.ProjectRepository;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class ProjectService {
    
    private final ProjectRepository projectRepository;

    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    public Project addProject(String type, String description, MultipartFile imageFile) throws IOException {
        Project project = new Project();
        project.setType(type);
        project.setDescription(description);
        project.setImage(imageFile.getBytes());
        return projectRepository.save(project);
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Optional<Project> getProjectById(Long id) {
        return projectRepository.findById(id);
    }
    
    public void deleteProject(Long id) {
    	projectRepository.deleteById(id);
    }
}
