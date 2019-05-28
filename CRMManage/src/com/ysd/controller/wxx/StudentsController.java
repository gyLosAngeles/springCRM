package com.ysd.controller.wxx;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Askers;
import com.ysd.entity.Push;
import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;
import com.ysd.service.wxx.StudentsService;

@Controller
public class StudentsController {
	@Autowired
private StudentsService studentsService;
	/**
	 * 分页多条件查询
	 * @param fenye
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/selectAllStudentsController",method=RequestMethod.POST)
 	public Fenye selectAllStudentsController(Fenye fenye,Askers askers) {
		fenye.setAskers(askers);
 		fenye.setRow(Integer.parseInt((String)fenye.getRows().get(0)));
 		Fenye selectAllStudentsService = studentsService.selectAllStudentsService(fenye);
		return selectAllStudentsService;
	}
	
	/**
     * 添加
     * @param s
     * @return
     */
	@ResponseBody
	@RequestMapping(value="/wl/insertCountStudents",method=RequestMethod.POST)
    public Integer insertCountStudents(Students students) {
    	 Integer addStudent = studentsService.insertCountStudents(students);
    	return addStudent;
    }
	/**
	 * 编辑
	 * @param students
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/updateStudents",method=RequestMethod.POST)
	public Integer updateStudents(Students students) {
   	  Integer updateStudents = studentsService.updateStudents(students);
   	return updateStudents;
   }
	/**
	 * 删除
	 * @param i
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/deleteStudents",method=RequestMethod.POST)
	public Integer deleteStudents(@RequestParam("ids[]")int[] ids) {
		Integer deleteStudents = null;
		for (int i = 0; i < ids.length; i++) {
			deleteStudents = studentsService.deleteStudents(ids[i]);
		}
		return deleteStudents;
	   }
	/**
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/deleteStudents2",method=RequestMethod.POST)
	public Integer deleteStudents2(String ids) {
		Integer deleteStudents = null;
		 String[] split = ids.split(",");
		for (int i = 0; i < split.length; i++) {
			deleteStudents = studentsService.deleteStudents(Integer.parseInt(split[i]));
		} 
		return deleteStudents;
	   }

	/**
	 * 查询咨询师名称
	 * @param askers
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/selectAskers",method=RequestMethod.POST)
	public List<Askers> selectAskers(Askers askers) {
		List<Askers> selectAskers = studentsService.selectAskers(askers);
		return selectAskers;
	}
	/**
	 * 动态推送
	 * @param push
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/wl/addPush",method=RequestMethod.POST)
	public Integer addPush(Push push) {
		System.out.println(push);
		 Integer addPush = studentsService.addPush(push);
		 System.out.println(addPush);
		return addPush;
	}
 
}
