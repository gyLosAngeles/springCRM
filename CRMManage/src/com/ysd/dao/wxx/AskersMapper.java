package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Askers;

public interface AskersMapper {
/**
 * 修改
 * @param askers
 * @return
 */
  Integer updateAskers(Askers askers);
  /**
   * 查询所有
   * @param fenye
   * @return
   */
  List<Askers> selectAskers(Askers askers);
}
