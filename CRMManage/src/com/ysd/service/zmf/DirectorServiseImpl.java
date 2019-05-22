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
	@Autowired
	private UserChecks userChecks;
	public DataGridData selectSignIn(Fenye fenye) {
		dataGridData.setRows(userChecksMapper.selectAskersChecksByFenye(fenye));
		dataGridData.setTotal(userChecksMapper.selectAskersChecksCountByFenye(fenye));
		return dataGridData;
	}
	public int updateSignIn(Askers askers) {
		if(userChecksMapper.updateAskersCheckState(askers)>0) {
			if(askers.getCheckState()==1) {
				userChecks.setCheckState(askers.getCheckState());
				userChecks.setUserName(askers.getAskerName());
				userChecks.setUserId(askers.getAskerId());
				return userChecksMapper.insertUserChecksNetfollows(userChecks);
			}else {
				userChecks.setCheckState(askers.getCheckState());
				userChecks.setUserName(askers.getAskerName());
				return userChecksMapper.updateUserChecksNetfollows(userChecks);
			}
		}
		return 0;
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
	 
	public List<Askers> selectAskersByRoleName() {
		return userChecksMapper.selectAskersByroleName();
	}
}
