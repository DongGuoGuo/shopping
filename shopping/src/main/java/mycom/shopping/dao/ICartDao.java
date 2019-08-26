package mycom.shopping.dao;

import mycom.shopping.domain.ShoppingCart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ICartDao {

    /**
     * 查询所有购物车
     * @return
     */
    @Select("select * from shoppingcart where user_name =  #{user_name} and cart_is = 'N' order by cart_is")
    List<ShoppingCart> findAll1(String user_name);


    /**
     * 查询所有购物车
     * @return
     */
    @Select("select * from shoppingcart where user_name =  #{user_name} order by cart_is")
    List<ShoppingCart> findAll(String user_name);



    /**
     * 查询所有购物车
     * @return
     */
    @Select("select * from shoppingcart")
    List<ShoppingCart> findAll2();


    /**
     * 查询根据商品名查询
     * @return
     */
    @Select("select * from shoppingcart where goods_name = #{goods_name}")
    List<ShoppingCart> findByGoods_name(String goods_name);


    /**
     * 查询根据商品名查询
     * @return
     */
    @Select("select * from shoppingcart where goods_id = #{goods_id}")
    ShoppingCart findByGoods_id(String goods_id);



    /**
     * 保存购物车
     * @param shoppingCart
     */
    @Insert("insert into shoppingcart(user_name,goods_name,goods_img,goods_price,goods_size,goods_amount,cart_is) values(#{user_name},#{goods_name},#{goods_img},#{goods_price},#{goods_size},#{goods_amount},#{cart_is})")
    void saveShoppingCart(ShoppingCart shoppingCart);

    /**
     * 更新购物车
     * @param shoppingCart
     */
    @Update("update shoppingcart set goods_img=#{goods_img},goods_price=#{goods_price},goods_amount=#{goods_amount},cart_is=#{cart_is} where goods_name=#{goods_name}")
    void  updataShoppingCart(ShoppingCart shoppingCart);

    /**
     * 删除购物车
     * @param goods_id
     */
    @Delete("delete from shoppingcart where goods_id = #{goods_id}")
    void deleteShoppingCart(int goods_id);


}
