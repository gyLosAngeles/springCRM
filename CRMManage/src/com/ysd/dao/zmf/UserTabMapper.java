package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.UserTab;

public interface UserTabMapper {

	/**
	 *多条件 查询用户
	 * @param fenye
	 * @return
	 */
	List<UserTab> selectUserByTiaoJian(Fenye fenye);

	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	int selectUserCountByTiaoJian(Fenye fenye);
	/**
	 * 添加用户
	 * @param userTab
	 * @return
	 */
	int insertUser(UserTab userTab);

	/**
	 * 修改用户
	 * @param userTab
	 * @return
	 */
	int updateUser(UserTab userTab);
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	int deleteUser(String userName);
	/**
	 * 根据用户名查询
	 * @param userName
	 * @return
	 */
	UserTab selectUserByuserName(String userName);
}
