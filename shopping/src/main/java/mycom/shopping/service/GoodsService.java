package mycom.shopping.service;

import mycom.shopping.dao.IGoodsDao;
import mycom.shopping.domain.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    @Autowired
    private IGoodsDao iGoodsDao;
    /**
     * 查询所有商品
     * @return
     */
    public List<Goods> findAll(){
        return iGoodsDao.findAll();
    }

    public List<Goods> findShopAll(String goods_shop){
        return iGoodsDao.findShopAll(goods_shop);
    }
    /**
     *热搜
     * @param goods_type
     * @return
     */
    public List<Goods> findReSou(String goods_type){
        return iGoodsDao.findReSou(goods_type);
    }



    public Goods findByGoods_id(String goods_id){
        return iGoodsDao.findByGoods_id(goods_id);
    }

    /**
     * 查询根据商品名查询
     * @return
     */
    public Goods findByGoods_name(String goods_name){
        return iGoodsDao.findByGoods_name(goods_name).get(0);
    }


    /**
     * 根据商品名字模糊搜索
     * @param goods_name
     * @return
     */
    public List<Goods> findByNamemohu(String goods_name){
        return iGoodsDao.findByNamemohu(goods_name);
    }


    /**
     * 保存商品
     * @param goods
     */
    public boolean saveUser(Goods goods){
        try{
            iGoodsDao.saveUser(goods);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    /**
     * 更新商品
     * @param goods
     */
    public boolean  updataUser(Goods goods){
        try{
            iGoodsDao.updataUser(goods);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    /**
     * 删除商品
     * @param goods_id
     */
    public boolean deleteGoods(int goods_id){
        try{
            iGoodsDao.deleteGoods(goods_id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
