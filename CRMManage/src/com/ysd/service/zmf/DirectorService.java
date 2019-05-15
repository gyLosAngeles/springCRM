package com.ysd.service.zmf;


import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

public interface DirectorService {
	/**
	 * «©µΩ≤È—Ø
	 * @return
	 */
	DataGridData selectSignIn(Fenye fenye);
	/**
	 * «©µΩ
	 * @param userChecks
	 * @return
	 */
	int updateSignIn(UserChecks userChecks);
}
