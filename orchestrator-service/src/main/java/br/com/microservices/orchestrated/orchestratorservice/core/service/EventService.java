package br.com.microservices.orchestrated.orchestratorservice.core.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class EventService {

    private final EventRepository repository;
}
