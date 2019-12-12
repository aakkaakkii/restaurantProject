package com.restaurant.web.view.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@RestController
public class SiteMap {

    @Value("${siteMap.path}")
    private String siteMapFilePath;

    @RequestMapping("/sitemap.xml")
    public void saveTxtFile(HttpServletResponse response) throws IOException {

        String yourXmlFileInAString;
        response.setContentType("application/xml");
        BufferedReader br = new BufferedReader(new FileReader(new File(siteMapFilePath)));
        String line;
        StringBuilder sb = new StringBuilder();

        while((line=br.readLine())!= null){
            sb.append(line);
        }

        yourXmlFileInAString  = sb.toString();

        ServletOutputStream outStream = response.getOutputStream();
        outStream.println(yourXmlFileInAString);
        outStream.flush();
        outStream.close();
    }
}
