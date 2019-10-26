package com.restaurant.server.restaurant.gallery.api;

import com.restaurant.server.restaurant.gallery.entity.Gallery;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface GalleryService {
    Gallery addFileToGallery(Gallery gallery, MultipartFile file) throws IOException;

    Gallery getGallery(String filename);
}
