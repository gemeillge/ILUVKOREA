package kr.ac.kopo.kor.model;

public class Member {
	public String id;
	public String name;
	public String tel;
	public String address;
	public String passwd;
	public String email;
	//public String approval_status;
	//private String approval_key;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/*
	 * public String getApproval_status() { return approval_status; }
	 * 
	 * public void setApproval_status(String approval_status) { this.approval_status
	 * = approval_status; }
	 * 
	 * public String getApproval_key() { return approval_key; }
	 * 
	 * public void setApproval_key(String approval_key) { this.approval_key =
	 * approval_key; }
	 */
}
