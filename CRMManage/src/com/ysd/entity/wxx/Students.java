package com.ysd.entity.wxx;

import org.springframework.stereotype.Component;

import com.ysd.entity.Askers;

@Component
public class Students {
private Integer Id;//编号
private String Name;//名称
private Integer Age;//年龄
private String Sex;//性别
private String Phone;//电话
private String StuStatus;//客户状态
private String PerState;//学员关注
private String MsgSource;//来源部门
private String SourceUrl;//来源网站
private String SourceKeyWord;//来源关键词
private String Address;//地址
private Integer NetPusherId;//
private Integer AskerId;//咨询师编号
private String QQ;//qq
private String WeiXin;//微信
private String Content;//内容
private String CreateTime;//创建时间
private String LearnForward;//课程方向
private Integer IsValid;//是否有效
private String Record;//记录
private String IsReturnVist;//是否回访
private String FirstVisitTime;//首访时间
private String IsHome;//是否上门
private String HomeTime;//上门时间
private Integer LostValid;//无效原因
private String IsPay;//是否缴费
private String PayTime;//缴费时间
private String Money;//金额
private String IsReturnMoney;//是否退费
private String IsInClass;//是否进班
private String InClassTime;//进班时间
private String InClassContent;//进班备注
private String AskerContent;//咨询师备注
private String IsDel;//是否删除
private String FromPart;//来源渠道
private String StuConcern;//学员关注
private String IsBaoBei;//是否报备
private String ZiXunName;//咨询师
private String CreateUser;//录入人
private String ReturnMoneyReason;//退费原因
private String PreMoney;//定金金额
private String PreMoneyTime;//定金时间
private String Scoring;//打分
private String Education;//学历
private String Location;//所在区域
private String Onlineremark;//在线备注
private Askers askers;
public String getOnlineremark() {
	return Onlineremark;
}
public void setOnlineremark(String onlineremark) {
	Onlineremark = onlineremark;
}
public Integer getId() {
	return Id;
}
public void setId(Integer id) {
	Id = id;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public Integer getAge() {
	return Age;
}
public void setAge(Integer age) {
	Age = age;
}
public String getSex() {
	return Sex;
}
public void setSex(String sex) {
	Sex = sex;
}
public String getPhone() {
	return Phone;
}
public void setPhone(String phone) {
	Phone = phone;
}
public String getStuStatus() {
	return StuStatus;
}
public void setStuStatus(String stuStatus) {
	StuStatus = stuStatus;
}
public String getPerState() {
	return PerState;
}
public void setPerState(String perState) {
	PerState = perState;
}
public String getMsgSource() {
	return MsgSource;
}
public void setMsgSource(String msgSource) {
	MsgSource = msgSource;
}
public String getSourceUrl() {
	return SourceUrl;
}
public void setSourceUrl(String sourceUrl) {
	SourceUrl = sourceUrl;
}
public String getSourceKeyWord() {
	return SourceKeyWord;
}
public void setSourceKeyWord(String sourceKeyWord) {
	SourceKeyWord = sourceKeyWord;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public Integer getNetPusherId() {
	return NetPusherId;
}
public void setNetPusherId(Integer netPusherId) {
	NetPusherId = netPusherId;
}
public Integer getAskerId() {
	return AskerId;
}
public void setAskerId(Integer askerId) {
	AskerId = askerId;
}
public String getQQ() {
	return QQ;
}
public void setQQ(String qQ) {
	QQ = qQ;
}
public String getWeiXin() {
	return WeiXin;
}
public void setWeiXin(String weiXin) {
	WeiXin = weiXin;
}
public String getContent() {
	return Content;
}
public void setContent(String content) {
	Content = content;
}
public String getCreateTime() {
	return CreateTime;
}
public void setCreateTime(String createTime) {
	CreateTime = createTime;
}
public String getLearnForward() {
	return LearnForward;
}
public void setLearnForward(String learnForward) {
	LearnForward = learnForward;
}
public Integer getIsValid() {
	return IsValid;
}
public void setIsValid(Integer isValid) {
	IsValid = isValid;
}
public String getRecord() {
	return Record;
}
public void setRecord(String record) {
	Record = record;
}
public String getIsReturnVist() {
	return IsReturnVist;
}
public void setIsReturnVist(String isReturnVist) {
	IsReturnVist = isReturnVist;
}
public String getFirstVisitTime() {
	return FirstVisitTime;
}
public void setFirstVisitTime(String firstVisitTime) {
	FirstVisitTime = firstVisitTime;
}
public String getIsHome() {
	return IsHome;
}
public void setIsHome(String isHome) {
	IsHome = isHome;
}
public String getHomeTime() {
	return HomeTime;
}
public void setHomeTime(String homeTime) {
	HomeTime = homeTime;
}
public Integer getLostValid() {
	return LostValid;
}
public void setLostValid(Integer lostValid) {
	LostValid = lostValid;
}
public String getIsPay() {
	return IsPay;
}
public void setIsPay(String isPay) {
	IsPay = isPay;
}
public String getPayTime() {
	return PayTime;
}
public void setPayTime(String payTime) {
	PayTime = payTime;
}
public String getMoney() {
	return Money;
}
public void setMoney(String money) {
	Money = money;
}
public String getIsReturnMoney() {
	return IsReturnMoney;
}
public void setIsReturnMoney(String isReturnMoney) {
	IsReturnMoney = isReturnMoney;
}
public String getIsInClass() {
	return IsInClass;
}
public void setIsInClass(String isInClass) {
	IsInClass = isInClass;
}
public String getInClassTime() {
	return InClassTime;
}
public void setInClassTime(String inClassTime) {
	InClassTime = inClassTime;
}
public String getInClassContent() {
	return InClassContent;
}
public void setInClassContent(String inClassContent) {
	InClassContent = inClassContent;
}
public String getAskerContent() {
	return AskerContent;
}
public void setAskerContent(String askerContent) {
	AskerContent = askerContent;
}
public String getIsDel() {
	return IsDel;
}
public void setIsDel(String isDel) {
	IsDel = isDel;
}
public String getFromPart() {
	return FromPart;
}
public void setFromPart(String fromPart) {
	FromPart = fromPart;
}
public String getStuConcern() {
	return StuConcern;
}
public void setStuConcern(String stuConcern) {
	StuConcern = stuConcern;
}
public String getIsBaoBei() {
	return IsBaoBei;
}
public void setIsBaoBei(String isBaoBei) {
	IsBaoBei = isBaoBei;
}
public String getZiXunName() {
	return ZiXunName;
}
public void setZiXunName(String ziXunName) {
	ZiXunName = ziXunName;
}
public String getCreateUser() {
	return CreateUser;
}
public void setCreateUser(String createUser) {
	CreateUser = createUser;
}
public String getReturnMoneyReason() {
	return ReturnMoneyReason;
}
public void setReturnMoneyReason(String returnMoneyReason) {
	ReturnMoneyReason = returnMoneyReason;
}
public String getPreMoney() {
	return PreMoney;
}
public void setPreMoney(String preMoney) {
	PreMoney = preMoney;
}
public String getPreMoneyTime() {
	return PreMoneyTime;
}
public void setPreMoneyTime(String preMoneyTime) {
	PreMoneyTime = preMoneyTime;
}

public String getScoring() {
	return Scoring;
}
public void setScoring(String scoring) {
	Scoring = scoring;
}
public String getEducation() {
	return Education;
}
public void setEducation(String education) {
	Education = education;
}
public String getLocation() {
	return Location;
}
public void setLocation(String location) {
	Location = location;
}

public Askers getAskers() {
	return askers;
}
public void setAskers(Askers askers) {
	this.askers = askers;
}
@Override
public String toString() {
	return "Students [Id=" + Id + ", Name=" + Name + ", Age=" + Age + ", Sex=" + Sex + ", Phone=" + Phone
			+ ", StuStatus=" + StuStatus + ", PerState=" + PerState + ", MsgSource=" + MsgSource + ", SourceUrl="
			+ SourceUrl + ", SourceKeyWord=" + SourceKeyWord + ", Address=" + Address + ", NetPusherId=" + NetPusherId
			+ ", AskerId=" + AskerId + ", QQ=" + QQ + ", WeiXin=" + WeiXin + ", Content=" + Content + ", CreateTime="
			+ CreateTime + ", LearnForward=" + LearnForward + ", IsValid=" + IsValid + ", Record=" + Record
			+ ", IsReturnVist=" + IsReturnVist + ", FirstVisitTime=" + FirstVisitTime + ", IsHome=" + IsHome
			+ ", HomeTime=" + HomeTime + ", LostValid=" + LostValid + ", IsPay=" + IsPay + ", PayTime=" + PayTime
			+ ", Money=" + Money + ", IsReturnMoney=" + IsReturnMoney + ", IsInClass=" + IsInClass + ", InClassTime="
			+ InClassTime + ", InClassContent=" + InClassContent + ", AskerContent=" + AskerContent + ", IsDel=" + IsDel
			+ ", FromPart=" + FromPart + ", StuConcern=" + StuConcern + ", IsBaoBei=" + IsBaoBei + ", ZiXunName="
			+ ZiXunName + ", CreateUser=" + CreateUser + ", ReturnMoneyReason=" + ReturnMoneyReason + ", PreMoney="
			+ PreMoney + ", PreMoneyTime=" + PreMoneyTime + ", Scoring=" + Scoring + ", Education=" + Education
			+ ", Location=" + Location + ", Onlineremark=" + Onlineremark + ", askers=" + askers + "]";
}
}
