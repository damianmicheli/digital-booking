package com.backend.service;
import com.backend.dto.CiudadDTO;
import com.backend.entity.Ciudad;
import com.backend.repository.ICiudadRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CiudadService implements ICiudadService{

    private final Logger logger = Logger.getLogger(CiudadService.class);

    @Autowired
    private ICiudadRepository ciudadRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public List<CiudadDTO> listarTodos() {

        List<Ciudad> ciudades = ciudadRepository.findAll();
        List<CiudadDTO> ciudadesDTO = new ArrayList<>();

        for (Ciudad ciudad : ciudades){
            ciudadesDTO.add(mapper.convertValue(ciudad, CiudadDTO.class));
        }

        logger.info("Se listaron todas las ciudades.");

        return ciudadesDTO;
    }

}
