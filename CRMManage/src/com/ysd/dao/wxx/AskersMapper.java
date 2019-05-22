package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.zmf.StaffParcel;

public interface AskersMapper {
  /**
   * 查询所有
   * @param fenye
   * @return
   */
  List<Askers> selectAskers(Askers askers);
  /**
   * 添加咨询师
   * @param askers
   * @return
   */
  int insertAskers(Askers askers);
  /**
   * 删除咨询师
   * @param askersName
   * @return
   */
  int deleteAskers(String Askers);
  /**
   * 根据名字查询数量
   * @param name
   * @return
   */
  Integer selectCountByaskersName(String name);
  /**
   * 根据用户名查询对应的咨询师角色
   * @param name
   * @return
   */
  String selectRoleNameByUserName(String name);
  /**
        * 查询咨询师开启状态
   * @param roleName
   * @return
   */
  int selectAskersByRoleName();
  /**
   * 查询所有咨询师以及手中的学生
   * @return
   */
  List<StaffParcel> selectStaffParcel();
}
