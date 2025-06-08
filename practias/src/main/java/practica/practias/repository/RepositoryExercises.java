package practica.practias.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import practica.practias.model.Exercises;

@Repository
public interface RepositoryExercises extends JpaRepository<Exercises, Long>{

}
