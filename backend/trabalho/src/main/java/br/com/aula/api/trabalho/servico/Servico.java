package br.com.aula.api.trabalho.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import br.com.aula.api.trabalho.model.Mensagem;
import br.com.aula.api.trabalho.model.Usuario;
import br.com.aula.api.trabalho.repository.UsuarioRepositorio;


@Service
public class Servico {
    
    @Autowired
    private Mensagem mensagem;

    @Autowired
    private UsuarioRepositorio acao;

    //Metodo cadastrar e validar
    public ResponseEntity<?> Cadastrar(Usuario obj){

        if (obj.getNome().equals("")){
            mensagem.setMensagem("O campo nome não pode estar vazio");
            return new ResponseEntity<>(mensagem, HttpStatus.BAD_REQUEST);
        } else if (obj.getEmail().equals("")) {
            mensagem.setMensagem("O campo email não pode estar vazio");
            return new ResponseEntity<>(mensagem, HttpStatus.BAD_REQUEST);
        } else if (obj.getMatricula().equals("")){
            mensagem.setMensagem("O campo matricula não pode estar vazio");
            return new ResponseEntity<>(mensagem, HttpStatus.BAD_REQUEST);
        } else if(obj.getSenha().equals("")){
            mensagem.setMensagem("O campo senha não pode estar vazio");
            return new ResponseEntity<>(mensagem, HttpStatus.BAD_REQUEST);
        } 
        else {
            return new ResponseEntity<>(acao.save(obj), HttpStatus.CREATED);
        }

    }

    //Metodo Selecionar pessoas
    public ResponseEntity<?> selecionar(){
        return new ResponseEntity<>(acao.findAll(),HttpStatus.OK);
    }
   
    
    //Metodo Validar a busca por id
    public ResponseEntity<?> Listarid(int id){
       
        if(acao.countByid(id) == 0) {
            mensagem.setMensagem("Nenhuma pessoa encontrada");
            return new ResponseEntity<>(mensagem, HttpStatus.NOT_FOUND);
        }  else {
          return new ResponseEntity<>(acao.findByid(id), HttpStatus.OK);
        }
    }

    //Metodo editar dados
    public ResponseEntity<?> Editar(Usuario obj) {
        
        if(acao.countByid(obj.getId()) == 0){
            mensagem.setMensagem("O Id Informado Não Existe");
            return new ResponseEntity<>(mensagem, HttpStatus.NOT_FOUND);
        }  else {
            return new ResponseEntity<>(acao.save(obj), HttpStatus.OK);
        }
    }

    //Excluir Registros pelo ID
    public ResponseEntity<?> Excluir(int id){
        if(acao.countByid(id) == 0) {
            mensagem.setMensagem("Nenhuma pessoa encontrada");
            return new ResponseEntity<>(mensagem, HttpStatus.NOT_FOUND);
        }  else {
            Usuario obj = acao.findByid(id);
            acao.delete(obj);
            
            mensagem.setMensagem("Registro removido com sucesso!");
            return new ResponseEntity<>(mensagem, HttpStatus.OK);
        }

    }


}