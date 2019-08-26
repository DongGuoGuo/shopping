package mycom.shopping.service;

import mycom.shopping.dao.IAdminDao;
import mycom.shopping.domain.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private IAdminDao iAdminDao;
    public Shop findByAdminname(String shop_name){
        List<Shop> byAdminname = iAdminDao.findByAdminname(shop_name);
        return byAdminname.get(0);
    }
}
