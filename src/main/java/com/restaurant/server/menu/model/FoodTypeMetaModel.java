package com.restaurant.server.menu.model;

import java.util.List;

public class FoodTypeMetaModel {
    private Long id;
    private String nameEn;
    private String nameFi;
    private String imgName;
    private List<FoodMetaModel> foods;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getNameFi() {
        return nameFi;
    }

    public void setNameFi(String nameFi) {
        this.nameFi = nameFi;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public List<FoodMetaModel> getFoods() {
        return foods;
    }

    public void setFoods(List<FoodMetaModel> foods) {
        this.foods = foods;
    }
}
