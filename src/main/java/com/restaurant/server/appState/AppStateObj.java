package com.restaurant.server.appState;

import com.restaurant.server.appState.api.AppStateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Map;

@Component
public class AppStateObj {

    @Autowired
    private AppStateService appState;

    private Map<String, String> state;

    @PostConstruct
    private void postConstructor(){
        updateObjectState();
    }

    public void updateStateValue(String key, String val){
        appState.updateState(key, val);
        updateObjectState();
    }

    public Map<String, String> getState(){
        return state;
    }

    public void updateObjectState(){
        this.state = appState.getState();
    }

    public interface stateKeys{
        String IS_RESERVATION_ENABLED_key ="is_reservation_enabled";
    }
}
