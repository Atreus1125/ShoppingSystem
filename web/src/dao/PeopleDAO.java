package dao;

import entity.People;

public interface PeopleDAO {
    /**
     * 插入用户数据
     * @return 插入行数
     */
    public abstract int doInsert(int id, String password, String name, String email, String address, int status);

    public abstract int doDelete(int id, String password);

    public abstract int doUpdate(int id, String password, String name, String email, String address, int status);

    /**
     * 根据用户编号和密码查询用户数据
     * @return 查询到的用户实体
     */
    public abstract People findByLogin(int id, String password);

    /**
     * 根据用户编号查询用户数据
     * @return 查询到的用户实体
     */
    public abstract People findById(int id);
}
