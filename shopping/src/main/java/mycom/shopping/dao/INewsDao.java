package mycom.shopping.dao;

import mycom.shopping.domain.News;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface INewsDao {
    @Select("select * from news where news_type = #{news_type}")
    List<News> findAll(String news_type);


    @Select("select * from news")
    List<News> findAll1();

    @Insert("insert into news(news_title,news_uil,news_type) values(#{news_title},#{news_uil},#{news_type})")
    void saveUser(News news);

}
