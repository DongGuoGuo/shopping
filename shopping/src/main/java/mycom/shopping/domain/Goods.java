package mycom.shopping.domain;

public class Goods {
    private int goods_id;
    private String goods_name;
    private String goods_img;
    private String goods_price;
    private int goods_shop;
    private String goods_type;
    private int goods_hits;

    public Goods() {
    }

    public Goods(String goods_name, String goods_img, String goods_price, int goods_shop, String goods_type, int goods_hits) {
        this.goods_name = goods_name;
        this.goods_img = goods_img;
        this.goods_price = goods_price;
        this.goods_shop = goods_shop;
        this.goods_type = goods_type;
        this.goods_hits = goods_hits;
    }

    public Goods(int goods_id, String goods_name, String goods_img, String goods_price, int goods_shop, String goods_type, int goods_hits) {
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.goods_img = goods_img;
        this.goods_price = goods_price;
        this.goods_shop = goods_shop;
        this.goods_type = goods_type;
        this.goods_hits = goods_hits;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
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

    public int getGoods_shop() {
        return goods_shop;
    }

    public void setGoods_shop(int goods_shop) {
        this.goods_shop = goods_shop;
    }

    public String getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(String goods_type) {
        this.goods_type = goods_type;
    }

    public int getGoods_hits() {
        return goods_hits;
    }

    public void setGoods_hits(int goods_hits) {
        this.goods_hits = goods_hits;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goods_id=" + goods_id +
                ", goods_name='" + goods_name + '\'' +
                ", goods_img='" + goods_img + '\'' +
                ", goods_price='" + goods_price + '\'' +
                ", goods_shop=" + goods_shop +
                ", goods_type='" + goods_type + '\'' +
                ", goods_hits=" + goods_hits +
                '}';
    }
}
