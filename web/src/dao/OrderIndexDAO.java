package dao;

import entity.OrderIndex;

import java.util.Date;
import java.util.List;

public interface OrderIndexDAO {

    /**
     * 插入订单索引数据
     * 订单编号自动生成
     * @return 插入数据生成的主键值
     */
    public abstract int doInsert(int person_id, int price, String address, Date date, int status);

    public abstract int doUpdate(int id, int person_id, int price, String address, Date date, int status);

    /**
     * 根据订单编号查找订单
     * @return 订单索引实体
     */
    public abstract OrderIndex findById(int id);

    /**
     * 根据用户编号查找订单
     * @return 该用户的全部订单索引实体的数组
     */
    public abstract List<OrderIndex> findAllById(int person_id);
}
