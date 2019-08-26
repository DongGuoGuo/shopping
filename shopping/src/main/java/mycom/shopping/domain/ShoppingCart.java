package mycom.shopping.domain;

public class ShoppingCart {
    private int cart_id;
    private String goods_name;
    private String user_name;
    private String goods_img;
    private String goods_price;
    private String  goods_size;
    private String goods_amount;
    private String cart_is;

    public ShoppingCart() {
    }

    public ShoppingCart(String goods_name,String user_name, String goods_img, String goods_price, String goods_size, String goods_amount) {
        this.goods_name = goods_name;
        this.user_name = user_name;
        this.goods_img = goods_img;
        this.goods_price = goods_price;
        this.goods_size = goods_size;
        this.goods_amount = goods_amount;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getGoods_size() {
        return goods_size;
    }

    public void setGoods_size(String goods_size) {
        this.goods_size = goods_size;
    }

    public String getCart_is() {
        return cart_is;
    }

    public void setCart_is(String cart_is) {
        this.cart_is = cart_is;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_img() {
        return goods_img;
    }

    public void setGoods_img(String goods_img) {
        this.goods_img = goods_img;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_amount() {
        return goods_amount;
    }

    public void setGoods_amount(String goods_amount) {
        this.goods_amount = goods_amount;
    }


    @Override
    public String toString() {
        return "ShoppingCart{" +
                "cart_id=" + cart_id +
                ", goods_name='" + goods_name + '\'' +
                ", user_name='" + user_name + '\'' +
                ", goods_img='" + goods_img + '\'' +
                ", goods_price='" + goods_price + '\'' +
                ", goods_size='" + goods_size + '\'' +
                ", goods_amount='" + goods_amount + '\'' +
                ", cart_is='" + cart_is + '\'' +
                '}';
    }
}
