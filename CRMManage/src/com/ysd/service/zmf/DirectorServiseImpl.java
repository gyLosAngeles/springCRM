package com.ysd.service.zmf;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.zmf.UserChecksMapper;
import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

@Service
public class DirectorServiseImpl implements DirectorService {

	
	@Autowired
	private UserChecksMapper userChecksMapper; 
	@Autowired
	private DataGridData dataGridData;
	
	public DataGridData selectSignIn(Fenye fenye) {
		dataGridData.setRows(userChecksMapper.selectUserChecksByFenye(fenye));
		dataGridData.setTotal(userChecksMapper.selectUserChecksCountByFenye(fenye));
		return dataGridData;
	}
	public int updateSignIn(UserChecks userChecks) {
		return userChecksMapper.updateUserChecks(userChecks);
	}

	
	public List<Askers> selectAskersAll(){
		return userChecksMapper.selectAskersAll();
	}
 
	public int updateAskersByAskerId(Askers askers) {
		return userChecksMapper.updateAskers(askers);
	}
	 
	public int selectUserCheckStateByUserName(String userName) {
		return userChecksMapper.selectCheckStateByUserName(userName);
	}
}
