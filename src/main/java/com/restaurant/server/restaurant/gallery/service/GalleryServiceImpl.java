package com.restaurant.server.restaurant.gallery.service;

import com.restaurant.server.restaurant.gallery.api.GalleryService;
import com.restaurant.server.restaurant.gallery.entity.Gallery;
import com.restaurant.server.restaurant.gallery.repo.GalleryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    private GalleryRepo galleryRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public Gallery addFileToGallery(Gallery gallery, MultipartFile file) throws IOException {
        File uploadDir = new File(uploadPath);

        if(!uploadDir.exists()){
            uploadDir.mkdir();
        }

        String uuidFile = UUID.randomUUID().toString();
        String resultFileName =uuidFile + "." + file.getOriginalFilename();

        file.transferTo(new File(uploadPath+"/"+resultFileName));

        gallery.setFileName(resultFileName);

        return galleryRepo.save(gallery);
    }

    @Override
    public Gallery getGallery(String filename) {
        return null;
    }
}
