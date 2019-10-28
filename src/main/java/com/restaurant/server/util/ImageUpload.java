package com.restaurant.server.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class ImageUpload {

    private static String uploadPath;


    public static String saveImage(MultipartFile file){
        if (isFileValid(file)){
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            try {
                file.transferTo(new File(uploadDir + "/" + resultFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return resultFileName;
        }

        return null;
    }

    public static void deleteImage(String filename){
        /*File file = new File(uploadPath + "/" + filename);
        file.delete();*/
        try {
            Files.deleteIfExists(Paths.get(uploadPath + "/" + filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String updateImage(MultipartFile file, String oldImgName) {
        String imageName = saveImage(file);

        if(imageName != null && !"".equals(imageName)){
            deleteImage(oldImgName);
        }

        return imageName;
    }

    public static boolean isFileValid(MultipartFile file){
        return file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty();
    }

    @Value("${upload.path}")
    public void setUploadPath(String path) {
        uploadPath = path;
    }
}
