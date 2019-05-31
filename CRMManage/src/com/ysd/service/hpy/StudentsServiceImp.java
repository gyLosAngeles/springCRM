package com.ysd.service.hpy;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.hpy.StudentMapper;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
@Service
public class StudentsServiceImp implements StudentsService {
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private DataGridData dataGridData;
	/*
	 * �޸�ѧ����Ϣ
	 */
	public Integer UpdateStu(CustomerStudents customerStudents) {
		return studentMapper.UpdateStu(customerStudents);
	}
	/*
	 * ���ѧ��������Ϣ
	 */
	public Integer insertNetfollows(Netfollows netfollows) {
		return studentMapper.insertNetfollows(netfollows);
	}
	/*
	 * ��ҳ��ѯѧ��������Ϣ
	 */
	public DataGridData selectNetfollows(Fenye fenye) {
		dataGridData.setRows(studentMapper.selectNetfollows(fenye));
		dataGridData.setTotal(studentMapper.selectCountNet(fenye));
		return dataGridData;
	}
	/*
	 * ������ѯʦ���ַ�ҳ��������ѯ��Ӧ��ѧ����Ϣ
	 */
	public DataGridData selectStuAsker(Fenye fenye) {
		fenye.getConsultantStuCondition().getAskerId();
		dataGridData.setRows(studentMapper.selectStuAsker(fenye));
		dataGridData.setTotal(studentMapper.selectCountStuAsker(fenye));
		return dataGridData;
	}
	/*
	 * ����ѧ��id��ѯ��Ӧѧ����ȫ��������Ϣ
	 */
	public List<Netfollows> selectNetfollowsID(Netfollows netfollows) {
		return studentMapper.selectNetfollowsID(netfollows);
	}
	/*
	 * ��ѯȫ��������Ϣ
	 */
	public List<Push> selectPush(Push push) {
		return studentMapper.selectPush(push);
	}
	/*
	 * �޸�������Ϣ״̬
	 */
	public Integer UpdatePush(Push push) {
		return studentMapper.UpdatePush(push);
	}
}
