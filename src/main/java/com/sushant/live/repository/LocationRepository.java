package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sushant.live.model.Location;

public interface LocationRepository extends JpaRepository<Location, Long> {
}