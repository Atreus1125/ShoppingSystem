package service;

import entity.People;

public interface PeopleService {

    /**
     * 用户注册
     * @return 0：注册成功，1：重复注册，2：其他原因
     */
    public abstract int register(People people);

    /**
     * 用户登录
     * @return true：注册成功，false：注册失败
     */
    public abstract boolean login(People people);

    /**
     * 根据id查找用户
     * @return 查询成功返回目标实体，失败返回{0, null, null, null, null, 0}
     */
    public abstract People find(int id);

    public abstract boolean alter(People people);
}
