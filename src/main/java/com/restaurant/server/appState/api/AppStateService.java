package com.restaurant.server.appState.api;

import java.util.List;
import java.util.Map;

public interface AppStateService {
    String getValue(String key);
    Map<String, String> getState();
    void updateState(String key, String val);
}
