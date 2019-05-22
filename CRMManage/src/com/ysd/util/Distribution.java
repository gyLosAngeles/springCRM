package com.ysd.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ysd.entity.zmf.StaffParcel;

@Component
public class Distribution {
     
	/**
	 * 返回最优咨询师
	 * @param staff
	 * @return
	 */
	public String getDistributionAskerName(List<StaffParcel> staff) {
		for (int i = 0; i < staff.size(); i++) {
			if(staff.get(i).getCheckState()==2) {
				staff.remove(i);
				i--;
			}
		}
		List<StaffParcel> asker = getMinCount(staff);
		if(asker.size()>1) {
			asker.set(0, getStaffParcel(asker));
		}
		return asker.get(0).getAskerName();
	}
	/**
	 * 返回学生数最少的咨询师
	 * @param staff
	 * @return
	 */
	private List<StaffParcel> getMinCount(List<StaffParcel> staff){
		 
		List<StaffParcel> js = new ArrayList<StaffParcel>();
		StaffParcel parcel = staff.get(0);
		for (StaffParcel staffParcel : staff) {
			 if(parcel.getCount()>staffParcel.getCount()) {
				 parcel = staffParcel;
			 }
		}
		 
		for (StaffParcel staffParcel : staff) {
			if(parcel.getCount()==staffParcel.getCount()) {
				js.add(staffParcel);
			}
		}
		 
		return js;
	}
	/**
	 * 返回权重最高的咨询师
	 * @param staff
	 * @return
	 */
	private StaffParcel getStaffParcel(List<StaffParcel> staff) {
		StaffParcel parcel = staff.get(0);
		
		for (StaffParcel staffParcel : staff) {
			if(staffParcel.getWeight()<staffParcel.getWeight()) {
				parcel = staffParcel;
			}
		}
		
		return parcel;
	}
}
