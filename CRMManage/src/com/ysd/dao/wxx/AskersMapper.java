package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Askers;

public interface AskersMapper {
  /**
   * ��ѯ����
   * @param fenye
   * @return
   */
  List<Askers> selectAskers(Askers askers);
}
