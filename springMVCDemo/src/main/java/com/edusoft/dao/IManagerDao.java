package com.edusoft.dao;

import com.edusoft.dto.Manager;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IManagerDao extends IBaseDao<Manager> {
}
