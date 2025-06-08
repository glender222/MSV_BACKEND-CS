package practica.practias.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import practica.practias.model.Exercises;
import practica.practias.repository.RepositoryExercises;
import practica.practias.service.ExercisesService;

@Service
public class ExercisesServiceImpl implements ExercisesService{

 private final RepositoryExercises repositoryExercises;


    public ExercisesServiceImpl(RepositoryExercises repositoryExercises) {
        this.repositoryExercises = repositoryExercises;
    }

    @Override
    public List<Exercises> getAllExercises() {
         return repositoryExercises.findAll();
    }

    @Override
    public Optional<Exercises> getExerciseById(Long id) {
        return repositoryExercises.findById(id);

    }

}
