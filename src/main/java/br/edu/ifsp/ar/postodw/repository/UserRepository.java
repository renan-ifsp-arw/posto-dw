package br.edu.ifsp.ar.postodw.repository;

import br.edu.ifsp.ar.postodw.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long>{
	
	public Optional<User> findByEmail(String email);

}
