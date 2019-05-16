package com.ysd.service.wxx;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.wxx.AskersMapper;
import com.ysd.dao.wxx.StudentsMapper;
import com.ysd.entity.Askers;
import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;
@Service
public class StudentsServiceImpl implements StudentsService {
	@Autowired
private StudentsMapper  studentsMapper;
	@Autowired
	private AskersMapper askersMapper;
	@Override
	public Fenye selectAllStudentsService(Fenye fenye) {
		fenye.setPage((fenye.getPage()-1)*fenye.getRow());
		List<Students> selectAllStudents = studentsMapper.selectAllStudents(fenye);
		Integer selectCountStudents = studentsMapper.selectCountStudents(fenye);
		fenye.setTotal(selectCountStudents);
		fenye.setRows(selectAllStudents);
		System.out.println(fenye.getName());
		return fenye;
	}
	@Override
	public Integer insertCountStudents(Students students) {
		Integer insertCountStudents = studentsMapper.insertCountStudents(students);
		return insertCountStudents;
	}
	@Override
	public Integer updateStudents(Students students) {
		Integer updateStudents = studentsMapper.updateStudents(students);
		return updateStudents;
	}
	@Override
	public Integer deleteStudents(Integer i) {
		Integer deleteStudents = studentsMapper.deleteStudents(i);
		return deleteStudents;
	}
	@Override
	public Integer updateAskers(Askers askers) {
		Integer updateAskers = askersMapper.updateAskers(askers);
		return updateAskers;
	}
	@Override
	public List<Askers> selectAskers(Askers askers) {
		List<Askers> selectAskers = askersMapper.selectAskers(askers);
		return selectAskers;
	}

}
