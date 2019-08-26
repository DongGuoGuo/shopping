package mycom.shopping.dao;

import mycom.shopping.domain.Goods;
import mycom.shopping.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IGoodsDao {
    /**
     * 查询所有商品
     * @return
     */
    @Select("select * from goods order by goods_hits desc")
    List<Goods> findAll();

    @Select("select * from goods where goods_shop = #{goods_shop} order by goods_hits desc")
    List<Goods> findShopAll(String goods_shop);




    /**
     * 查询所有商品
     * @return
     */
    @Select("select * from goods where goods_type = #{goods_type}  order by goods_hits desc")
    List<Goods> findReSou(String goods_type);






    /**
     * 查询根据商品名查询
     * @return
     */
    @Select("select * from goods where goods_name = #{goods_name}")
    List<Goods> findByGoods_name(String goods_name);


    /**
     * 查询根据商品名查询
     * @return
     */
    @Select("select * from goods where goods_id = #{goods_id}")
    Goods findByGoods_id(String goods_id);


    /**
     * 根据商品名字模糊搜索
     * @param goods_name
     * @return
     */
    @Select("select  * from goods where goods_name like concat('%',#{goods_name},'%') ")
    List<Goods> findByNamemohu(String goods_name);

    /**
     * 保存商品
     * @param goods
     */
    @Insert("insert into goods(goods_name,goods_img,goods_price,goods_shop,goods_type,goods_hits) values(#{goods_name},#{goods_img},#{goods_price},#{goods_shop},#{goods_type},#{goods_hits})")
    void saveUser(Goods goods);

    /**
     * 更新商品
     * @param goods
     */
    @Update("update goods set goods_name=#{goods_name},goods_img=#{goods_img},goods_price=#{goods_price},goods_type=#{goods_type},goods_hits=#{goods_hits},goods_shop=#{goods_shop} where goods_id=#{goods_id}")
    void  updataUser(Goods goods);

    /**
     * 删除商品
     * @param goods_id
     */
    @Delete("delete from goods where goods_id = #{goods_id}")
    void deleteGoods(int goods_id);


}
