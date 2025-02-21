package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sushant.live.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
}
