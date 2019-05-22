package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.zmf.StaffParcel;

public interface AskersMapper {
  /**
   * ��ѯ����
   * @param fenye
   * @return
   */
  List<Askers> selectAskers(Askers askers);
  /**
   * �����ѯʦ
   * @param askers
   * @return
   */
  int insertAskers(Askers askers);
  /**
   * ɾ����ѯʦ
   * @param askersName
   * @return
   */
  int deleteAskers(String Askers);
  /**
   * �������ֲ�ѯ����
   * @param name
   * @return
   */
  Integer selectCountByaskersName(String name);
  /**
   * �����û�����ѯ��Ӧ����ѯʦ��ɫ
   * @param name
   * @return
   */
  String selectRoleNameByUserName(String name);
  /**
        * ��ѯ��ѯʦ����״̬
   * @param roleName
   * @return
   */
  int selectAskersByRoleName();
  /**
   * ��ѯ������ѯʦ�Լ����е�ѧ��
   * @return
   */
  List<StaffParcel> selectStaffParcel();
}
