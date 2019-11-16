package com.restaurant.server.appState.service;

import com.restaurant.server.appState.api.AppStateService;
import com.restaurant.server.appState.entity.AppState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Map;

@Service
public class AppStateServiceImp implements AppStateService {
    @Autowired
    private EntityManager em;

    @Override
    public String getValue(String key) {
        return findState(key).getVal();
    }

    @Override
    public Map<String, String> getState() {
        List<AppState> tmp = em.createQuery("select d from AppState d", AppState.class).getResultList();
        Map<String, String>  resultList = null;

        for (AppState a: tmp){
            resultList.put(a.getKey(), a.getVal());
        }

        return resultList;
    }

    @Override
    public void updateState(String key, String val) {
        AppState appState = findState(key);
        appState.setVal(val);
        em.merge(appState);
    }

    private AppState findState(String key) {
        return em.createQuery("select d from AppState d where d.key = :keyValue", AppState.class)
                .setParameter("keyValue", key)
                .getSingleResult();
    }
}
