package com.ysd.service.wxx;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.wxx.AskersMapper;
import com.ysd.dao.wxx.StudentsMapper;
import com.ysd.entity.Askers;
import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;
import com.ysd.entity.zmf.StaffParcel;
import com.ysd.util.Distribution;
@Service
public class StudentsServiceImpl implements StudentsService {
	@Autowired
private StudentsMapper  studentsMapper;
	@Autowired
	private AskersMapper askersMapper;
	@Autowired
	private Distribution distribution; 
	public Fenye selectAllStudentsService(Fenye fenye) {
		fenye.setPage((fenye.getPage()-1)*fenye.getRow());
		String selectRoleNameByUserName = askersMapper.selectRoleNameByUserName(fenye.getUserName());
		if("1".equals(selectRoleNameByUserName)) {//如果是咨询师经理查询全部
			 fenye.setRows(studentsMapper.selectAllStudents(fenye));
			 fenye.setTotal(studentsMapper.selectCountStudents(fenye));
		}else if("2".equals(selectRoleNameByUserName)) {
			List<Students> selectStudentsByroleName = studentsMapper.selectStudentsByroleName(fenye);
			fenye.setRows(selectStudentsByroleName);
			 fenye.setTotal(studentsMapper.selectCountStudentsByroleName(fenye));
		}
		return fenye;
	}
	/**
	 *     添加
	 */
	public Integer insertCountStudents(Students students) {
		Integer insertCountStudents = studentsMapper.insertCountStudents(students);
		int bl = askersMapper.selectAskersByRoleName();
		if(bl==1) {
			List<StaffParcel> selectStaffParcel = askersMapper.selectStaffParcel();
			String AskerName = distribution.getDistributionAskerName(selectStaffParcel);
			students.setZiXunName(AskerName);
			updateAskers(students, null);
		}
		
		return insertCountStudents;
	}
	/**
	 * 编辑
	 */
	@Override
	public Integer updateStudents(Students students) {
		Integer updateStudents = studentsMapper.updateStudents(students);
		return updateStudents;
	}
	/**
	 * 删除
	 */
	public Integer deleteStudents(Integer i) {
		Integer deleteStudents = studentsMapper.deleteStudents(i);
		return deleteStudents;
	}
	/**
	 * 查询咨询师
	 */
	@Override
	public List<Askers> selectAskers(Askers askers) {
		List<Askers> selectAskers = askersMapper.selectAskers(askers);
		return selectAskers;
	}
	@Override
	public Integer updateAskers(Students students, int[] ids) {
		int jg=0;
		if(students.getId()!=null) {
			jg = studentsMapper.updateStudents(students);
		}else {
			for (int i = 0; i < ids.length; i++) {
				students.setId(ids[i]);
				jg = studentsMapper.updateStudents(students);
			}
		}
		
		return jg;
	}

}
