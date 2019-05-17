package com.ysd.service.zmf;


import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

public interface DirectorService {
	/**
	 * 签到查询
	 * @return
	 */
	DataGridData selectSignIn(Fenye fenye);
	/**
	 * 签到
	 * @param userChecks
	 * @return
	 */
	int updateSignIn(UserChecks userChecks);
	/**
	 * 查询所有咨询师
	 * @return
	 */
	public List<Askers> selectAskersAll();

	/**
	 * 修改对应咨询师的权重
	 * @param askers
	 * @return
	 */
	public int updateAskersByAskerId(Askers askers);
	/**
	 * 查询用户的签到状态
	 * @param userName
	 * @return
	 */
	public int selectUserCheckStateByUserName(String userName);
}
