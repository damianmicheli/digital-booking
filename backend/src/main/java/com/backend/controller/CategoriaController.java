package com.backend.controller;

import com.backend.dto.CategoriaDTO;
import com.backend.service.CategoriaService;
import com.backend.service.ConflictoException;
import com.backend.service.ICategoriaService;
import com.backend.service.NoEncontradoException;
import com.backend.util.Jsons;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("categorias")
public class CategoriaController {

    @Autowired
    private ICategoriaService categoriaService;

    @Operation(summary = "Buscar una categoria por su Id")
    @GetMapping("/{id}")
    public ResponseEntity<CategoriaDTO> buscar(@PathVariable Long id) throws NoEncontradoException {

        return new ResponseEntity<>(categoriaService.buscar(id), HttpStatus.OK);

    }

    @Operation(summary = "Dar de alta una categoria")
    @PostMapping
    public ResponseEntity<CategoriaDTO> guardar(@RequestBody CategoriaDTO categoriaDTO) throws ConflictoException {

        return new ResponseEntity<>(categoriaService.guardar(categoriaDTO), HttpStatus.OK);

    }

    @Operation(summary = "Listar todas las categorias")
    @GetMapping
    public ResponseEntity<List<CategoriaDTO>> listarTodos(){
        return new ResponseEntity<>(categoriaService.listarTodos(), HttpStatus.OK);

    }

    @Operation(summary = "Actualizar los datos de una categoria")
    @PutMapping
    public ResponseEntity<CategoriaDTO> actualizar(@RequestBody CategoriaDTO categoriaDTO) throws NoEncontradoException, ConflictoException {

        return new ResponseEntity<>(categoriaService.actualizar(categoriaDTO), HttpStatus.OK);

    }

    @Operation(summary = "Eliminar la categoria con el Id indicado")
    @DeleteMapping("/{id}")
    public ResponseEntity<String> eliminar(@PathVariable Long id) throws NoEncontradoException {

        categoriaService.eliminar(id);
        String mensaje = "La categoria con ID " + id + " se eliminó correctamente.";
        String mensajeJSON = Jsons.asJsonString(mensaje);
        return new ResponseEntity<>(mensajeJSON, HttpStatus.OK);

    }



//    @Operation(summary = "Eliminar el odontólogo con el Id indicado")
//    @DeleteMapping("/{id}")
//    public ResponseEntity<String> eliminar(@PathVariable Long id) throws NoEncontradoException {
//
//        categoriaService.eliminar(id);
//        String mensaje = "El odontólogo con ID " + id + " se eliminó correctamente.";
//        String mensajeJSON = Jsons.asJsonString(mensaje);
//        return new ResponseEntity<>(mensajeJSON, HttpStatus.OK);
//
//    }
//
//    @Operation(summary = "Actualizar los datos de un odontólogo")
//    @PutMapping
//    public ResponseEntity<CategoriaDTO> actualizar(@RequestBody CategoriaDTO categoriaDTO) throws NoEncontradoException, ConflictoException {
//
//        return new ResponseEntity<>(categoriaService.actualizar(categoriaDTO), HttpStatus.OK);
//
//    }

}

