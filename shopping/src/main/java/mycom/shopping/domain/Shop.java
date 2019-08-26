package mycom.shopping.domain;

public class Shop {
    private int shop_id;
    private String shop_name;
    private String shop_password;
    private String shop_owner;
    private String shop_info;
    private String shop_phone;

    public Shop() {
    }

    public String getShop_password() {
        return shop_password;
    }

    public void setShop_password(String shop_password) {
        this.shop_password = shop_password;
    }

    public String getShop_owner() {
        return shop_owner;
    }

    public void setShop_owner(String shop_owner) {
        this.shop_owner = shop_owner;
    }

    public String getShop_info() {
        return shop_info;
    }

    public void setShop_info(String shop_info) {
        this.shop_info = shop_info;
    }

    public Shop(String shop_name, String shop_password, String shop_owner, String shop_info, String shop_phone) {
        this.shop_name = shop_name;
        this.shop_password = shop_password;
        this.shop_owner = shop_owner;
        this.shop_info = shop_info;
        this.shop_phone = shop_phone;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getShop_phone() {
        return shop_phone;
    }

    public void setShop_phone(String shop_phone) {
        this.shop_phone = shop_phone;
    }


    @Override
    public String toString() {
        return "Shop{" +
                "shop_id=" + shop_id +
                ", shop_name='" + shop_name + '\'' +
                ", shop_password='" + shop_password + '\'' +
                ", shop_owner='" + shop_owner + '\'' +
                ", shop_info='" + shop_info + '\'' +
                ", shop_phone='" + shop_phone + '\'' +
                '}';
    }
}
