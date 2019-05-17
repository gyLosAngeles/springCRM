package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Askers;

public interface AskersMapper {
  /**
   * ²éÑ¯ËùÓĞ
   * @param fenye
   * @return
   */
  List<Askers> selectAskers(Askers askers);
}
