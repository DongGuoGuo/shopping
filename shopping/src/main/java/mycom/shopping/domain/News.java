package mycom.shopping.domain;

public class News {
    private int news_id;
    private String news_title;
    private String news_uil;
    private String news_type;

    public News() {
    }

    public News(String news_title, String news_uil, String news_type) {
        this.news_title = news_title;
        this.news_uil = news_uil;
        this.news_type = news_type;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public String getNews_uil() {
        return news_uil;
    }

    public void setNews_uil(String news_uil) {
        this.news_uil = news_uil;
    }

    public String getNews_type() {
        return news_type;
    }

    public void setNews_type(String news_type) {
        this.news_type = news_type;
    }

    @Override
    public String toString() {
        return "News{" +
                "news_id=" + news_id +
                ", news_title='" + news_title + '\'' +
                ", news_uil='" + news_uil + '\'' +
                ", news_type='" + news_type + '\'' +
                '}';
    }
}
