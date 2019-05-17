package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

 
public interface UserChecksMapper {

	/**
	 * 多条件查询签到员工
	 * @param fenye
	 * @return
	 */
	List<UserChecks> selectUserChecksByFenye(Fenye fenye);
	/**
	 * 查询所有员工
	 * @param fenye
	 * @return
	 */
	int selectUserChecksCountByFenye(Fenye fenye);
	/**
	 * 修改yuan
	 * @param userChecks
	 * @return
	 */
	int updateUserChecks(UserChecks userChecks);
	/**
	 * 添加需要签到的员工
	 * @param userChecks
	 * @return
	 */
	int inserUserChecks(UserChecks userChecks);
	/**
	 * 查询所有的咨询师
	 * @return
	 */
	List<Askers> selectAskersAll();
	/**
	 * 修改咨询师的权重和备注
	 * @param askers
	 * @return
	 */
	int updateAskers(Askers askers);
	/**
	 * 查询用户的签到状态
	 * @param userName
	 * @return
	 */
	int selectCheckStateByUserName(String userName);
}
