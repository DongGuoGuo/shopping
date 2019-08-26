package mycom.shopping.domain;

public class Jingdong {

    private String name;
    private String tupian_uri;
    private String price;

    public Jingdong() {
    }

    public Jingdong(String name, String tupian_uri, String price) {
        this.name = name;
        this.tupian_uri = tupian_uri;
        this.price = price;
    }

    public String getTupian_uri() {
        return tupian_uri;
    }

    public void setTupian_uri(String tupian_uri) {
        this.tupian_uri = tupian_uri;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Jingdong{" +
                "name='" + name + '\'' +
                ", tupian_uri='" + tupian_uri + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
