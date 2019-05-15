package com.ysd.dao.zmf;

import java.util.List;

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
}
