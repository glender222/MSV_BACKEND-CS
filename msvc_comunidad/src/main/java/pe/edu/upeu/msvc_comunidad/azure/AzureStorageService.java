package pe.edu.upeu.msvc_comunidad.azure;

import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClient;
import com.azure.storage.blob.BlobServiceClientBuilder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Service
public class AzureStorageService {

  private final BlobContainerClient containerClient;

    // La anotación @Value debe ir en un campo de la clase, no en una variable local
    @Value("${azure.storage.connection-string}")
    private String connectionString;

    @Value("${azure.storage.container-name:publicaciones}")
    private String containerName;

    public AzureStorageService(@Value("${azure.storage.connection-string}") String connectionString,
                              @Value("${azure.storage.container-name:publicaciones}") String containerName) {
        
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(connectionString)
                .buildClient();
        this.containerClient = blobServiceClient.getBlobContainerClient(containerName);
    }

    public String subirArchivo(MultipartFile file) {
        try {
            String fileName = UUID.randomUUID() + "-" + file.getOriginalFilename();
            BlobClient blobClient = containerClient.getBlobClient(fileName);
            blobClient.upload(file.getInputStream(), file.getSize(), true);
            return blobClient.getBlobUrl();
        } catch (IOException e) {
            throw new RuntimeException("Error al subir archivo a Azure", e);
        }
    }
}
