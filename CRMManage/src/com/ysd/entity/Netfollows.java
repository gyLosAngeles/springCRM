package com.ysd.entity;
//׷�ټ�¼
public class Netfollows {

	private int Id;//���
	private int StudentId;//ѧ�����
	private String StudentName;//ѧ������
	private String FollowTime;//׷��ʱ��
	private String NextFollowTime;//�´�׷��ʱ��
	private String Content;//����
	private int UserId;//�û����
	private String FollowType;//�ط÷�ʽ
	private String CreateTime;//����ʱ��
	private int FollowState;//�ط�״̬
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getStudentId() {
		return StudentId;
	}
	public void setStudentId(int studentId) {
		StudentId = studentId;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
	public String getFollowTime() {
		return FollowTime;
	}
	public void setFollowTime(String followTime) {
		FollowTime = followTime;
	}
	public String getNextFollowTime() {
		return NextFollowTime;
	}
	public void setNextFollowTime(String nextFollowTime) {
		NextFollowTime = nextFollowTime;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getFollowType() {
		return FollowType;
	}
	public void setFollowType(String followType) {
		FollowType = followType;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public int getFollowState() {
		return FollowState;
	}
	public void setFollowState(int followState) {
		FollowState = followState;
	}
	@Override
	public String toString() {
		return "Netfollows [Id=" + Id + ", StudentId=" + StudentId + ", StudentName=" + StudentName + ", FollowTime="
				+ FollowTime + ", NextFollowTime=" + NextFollowTime + ", Content=" + Content + ", UserId=" + UserId
				+ ", FollowType=" + FollowType + ", CreateTime=" + CreateTime + ", FollowState=" + FollowState + "]";
	}
	
}
