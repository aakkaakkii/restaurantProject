package com.restaurant.server.menu.model;

public class FoodMetaModel {

    private Long id;
    private String nameEn;
    private String nameFi;
    private String descriptionEn;
    private String descriptionFi;
    private double price;
    private String imgName;
    private CategoryMetaModel category;
    private FoodTypeMetaModel foodType;
    private Long categoryId;
    private Long foodTypeId;


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

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }

    public String getDescriptionFi() {
        return descriptionFi;
    }

    public void setDescriptionFi(String descriptionFi) {
        this.descriptionFi = descriptionFi;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public CategoryMetaModel getCategory() {
        return category;
    }

    public void setCategory(CategoryMetaModel category) {
        this.category = category;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public FoodTypeMetaModel getFoodType() {
        return foodType;
    }

    public void setFoodType(FoodTypeMetaModel foodType) {
        this.foodType = foodType;
    }

    public Long getFoodTypeId() {
        return foodTypeId;
    }

    public void setFoodTypeId(Long foodTypeId) {
        this.foodTypeId = foodTypeId;
    }
}
