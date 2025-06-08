package practica.practias.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import practica.practias.model.Result;
import practica.practias.model.Solution;

@Repository
public interface RepositoryResult extends JpaRepository<Result, Long>{
 Optional<Result> findBySolution(Solution solution);
    Optional<Result> findBySolutionId(Long solutionId);
    
}
