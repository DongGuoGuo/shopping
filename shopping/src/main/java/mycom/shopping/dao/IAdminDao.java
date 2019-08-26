package mycom.shopping.dao;

import mycom.shopping.domain.Shop;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAdminDao {
    @Select("select * from shop where shop_name = #{shop_name}")
    List<Shop> findByAdminname(String shop_name);

}
