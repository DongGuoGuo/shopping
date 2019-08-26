package mycom.shopping.service;



import mycom.shopping.dao.ICartDao;
import mycom.shopping.domain.Goods;
import mycom.shopping.domain.ShoppingCart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CartService {


    @Autowired
    public ICartDao iCartDao;
    /**
     * 查询所有购物车
     * @return
     */

    public List<ShoppingCart> findAll2(){
        List<ShoppingCart> all = iCartDao.findAll2();
        return all;
    }

    /**
     * 查询所有购物车
     * @return
     */
    public List<ShoppingCart> findAll1(String user_name){
        List<ShoppingCart> all = iCartDao.findAll1(user_name);
        return all;
    }

    /**
     * 查询所有购物车
     * @return
     */
    public List<ShoppingCart> findAll(String user_name){
        List<ShoppingCart> all = iCartDao.findAll(user_name);
        return all;
    }


    /**
     * 查询根据商品名查询
     * @return
     */
    public ShoppingCart findByGoods_name(String goods_name){
        List<ShoppingCart> byGoods_name = iCartDao.findByGoods_name(goods_name);
        return byGoods_name.get(0);
    }


    /**
     * 查询根据商品名查询
     * @return
     */
    public ShoppingCart findByGoods_id(String goods_id){
        ShoppingCart byGoods_id = iCartDao.findByGoods_id(goods_id);
        return byGoods_id;
    }



    /**
     * 保存购物车
     * @param shoppingCart
     */
    public void saveShoppingCart(ShoppingCart shoppingCart){
        iCartDao.saveShoppingCart(shoppingCart);
    }

    /**
     * 更新购物车
     * @param shoppingCart
     */
    public void  updataShoppingCart(ShoppingCart shoppingCart){
       iCartDao.updataShoppingCart(shoppingCart);
   }

    /**
     * 删除购物车
     * @param cart_id
     */
    public void deleteShoppingCart(int cart_id){
        iCartDao.deleteShoppingCart(cart_id);
    }


}
