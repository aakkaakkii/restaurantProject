package com.restaurant.web.rest.admin;

import com.restaurant.server.appState.AppStateObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("rest/state")
public class AppStateRest {
    @Autowired
    private AppStateObj appStateObj;

    @GetMapping
    public Map<String, String> getState(){
        return appStateObj.getState();
    }

    @PutMapping
    public void updateState(@RequestParam("key") String key, @RequestParam("val") String val){
        appStateObj.updateStateValue(key, val);
    }
}
