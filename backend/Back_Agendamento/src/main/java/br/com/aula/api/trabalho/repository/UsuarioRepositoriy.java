package br.com.aula.api.trabalho.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.aula.api.trabalho.model.Usuario;


@Repository
public interface UsuarioRepositoriy extends CrudRepository<Usuario, Integer> {
    
    List<Usuario> findAll();

    List<Usuario> findByNome(String nome);

    Usuario findByid(int id);

    int countByid(int cod);
}
