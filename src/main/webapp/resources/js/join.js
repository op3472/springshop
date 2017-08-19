function closed(){
	self.opener = null; 

	self.close()

}

function checkValue()
{
	var form = document.joinform;
	var reg_pwd = /^.*(?=.{8,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;


	if(!form.userId.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if(!form.userPw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(form.userPw.value != form.repassword.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}	
	if(!reg_pwd.test(form.userPw.value)){
		alert("비밀번호는 8~15자리 영문숫자 조합만가능합니다.");
		return false;
	}
	
	if(!form.userName.value){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if(!form.userEmail.value){
		alert("이메일을 입력하세요.");
		return false;
	}
}

function checkupdateValue()
{
	var form = document.joinform;
	var reg_pwd = /^.*(?=.{8,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

	
	if(!form.userPw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(form.userPw.value != form.repassword.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}	
	if(!reg_pwd.test(form.userPw.value)){
		alert("비밀번호는 8~15자리 영문숫자 조합만가능합니다.");
		return false;
	}
	
	if(!form.userName.value){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if(!form.userEmail.value){
		alert("이메일을 입력하세요.");
		return false;
	}
}




function inputIdChk(){
document.joinform.idDuplication.value="idUncheck";
}

