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
	 * 修改签到日志表中的状态
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
	 * 查询所有咨询师这个角色对应的人
	 * @return
	 */
	List<Askers> selectAskersByroleName();
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
	Integer selectCheckStateByUserName(String userName);
	
	
	/**
	 * 多条件查询咨询师签到
	 * @param fenye
	 * @return
	 */
	List<Askers> selectAskersChecksByFenye(Fenye fenye);
	/**
	 * 多条件查询咨询师签到数量
	 * @param fenye
	 * @return
	 */
	int selectAskersChecksCountByFenye(Fenye fenye);
	/**
	 * 修改咨询师经理的自动分配
	 * @param askers
	 * @return
	 */
	int udpateDirectorControllerChecks(Askers askers);
	/**
	 * 修改签到状态
	 * @param askers
	 * @return
	 */
	int updateAskersCheckState(Askers askers);
	
	/**
	 * 添加日志信息
	 * @param userChecks
	 * @return
	 */
	int insertUserChecksNetfollows(UserChecks userChecks);
	/**
	 * 退签成功时修改日志表的退签时间
	 * @param userChecks
	 * @return
	 */
	int updateUserChecksNetfollows(UserChecks userChecks);
}
