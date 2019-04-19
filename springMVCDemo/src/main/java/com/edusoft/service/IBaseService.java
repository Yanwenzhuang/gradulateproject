package com.edusoft.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IBaseService<T> {
    boolean add(T t) throws SQLException;

    T findOneByld(String id) throws SQLException;

    boolean update(T t) throws SQLException;

    List<T> findByProp(Map qv) throws SQLException;

    T findOneByProp(T t) throws SQLException;

    boolean delete(T t) throws SQLException;

}
