package com.backend.service;

import com.backend.dto.CategoriaDTO;
import com.backend.dto.UsuarioDTO;
import com.backend.entity.Categoria;
import com.backend.entity.Usuario;
import com.backend.repository.IUsuarioRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioService implements IUsuarioService{

    private final Logger logger = Logger.getLogger(UsuarioService.class);

    @Autowired
    IUsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public UsuarioDTO buscarPorId (Long id) throws NoEncontradoException {

        Optional<Usuario> usuario = usuarioRepository.findById(id);

        if (usuario.isEmpty()) {
            throw new NoEncontradoException("No existe usuario con el id especificado.");
        }

        UsuarioDTO usuarioEncontrado = mapper.convertValue(usuario, UsuarioDTO.class);

        usuarioEncontrado.setPassword("Password oculta");

        logger.info("Se busco por id el usuario> " + usuarioEncontrado);

        return usuarioEncontrado;
    };

    @Override
    public UsuarioDTO buscarPorEmail(String email) throws NoEncontradoException {

        Optional<Usuario> usuario = usuarioRepository.findUsuarioByEmail(email);

        if (usuario.isEmpty()) {
            throw new NoEncontradoException("El email especificado no existe");
        }

        UsuarioDTO usuarioEncontrado = mapper.convertValue(usuario, UsuarioDTO.class);

        usuarioEncontrado.setPassword("Password oculta");

        logger.info("Se busco por email el usuario> " + usuarioEncontrado);

        return usuarioEncontrado;
    }

    @Override
    public UsuarioDTO registrar(UsuarioDTO usuarioDTO) throws DatosIncorrectosException {

        Optional<Usuario> usuario = usuarioRepository.findUsuarioByEmail(usuarioDTO.getEmail());

        if (usuario.isPresent()) {
            throw new DatosIncorrectosException("El email especificado ya existe");
        }

        String encodedPassword = passwordEncoder.encode(usuarioDTO.getPassword());
        usuarioDTO.setPassword(encodedPassword);
        Usuario usuarioNuevo = usuarioRepository.save(mapper.convertValue(usuarioDTO, Usuario.class));


        UsuarioDTO usuarioGuardado = mapper.convertValue(usuarioNuevo, UsuarioDTO.class);
        usuarioGuardado.setPassword("Password oculta");

        logger.info("Se registró el usuario: " + usuarioGuardado.toString());

        return usuarioGuardado;

    }

    @Override
    public UsuarioDTO actualizarCiudad(UsuarioDTO usuarioDTO) throws NoEncontradoException {

        Long id = usuarioDTO.getId();

        Optional<Usuario> encontrado = usuarioRepository.findById(id);

        if (encontrado.isEmpty()){
            throw new NoEncontradoException("No se puede actualizar porque no existe un usuario con Id: " + id + ".");
        }

        Usuario usuarioModificado = encontrado.get();

        usuarioModificado.setCiudad(usuarioDTO.getCiudad());

        Usuario usuarioRes = usuarioRepository.save(usuarioModificado);

        UsuarioDTO usuarioDTOActualizado = mapper.convertValue(usuarioRes,UsuarioDTO.class);

        usuarioDTOActualizado.setPassword("Password oculta");

        logger.info("Datos actuales: " + usuarioDTOActualizado);


        return usuarioDTOActualizado;
    }
}