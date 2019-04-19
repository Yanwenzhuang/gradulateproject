package com.edusoft.dao;

import java.util.List;
import java.util.Map;

//持久层通用接口
public interface IBaseDao<T> {

    boolean add(T t);

    boolean update(T t);

    boolean delete(T t);

    T findOneById(String id);

    T findOneByProp(T t);

    List<T> findByProp(Map map);

}
