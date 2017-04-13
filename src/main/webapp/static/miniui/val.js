////////////////////////////////////////
function onEnglishVal(e) {
    if (e.isValid) {
        if (isEnglish(e.value) == false) {
            e.errorText = "必须输入英文";
            e.isValid = false;
        }
    }
}
function onChineseAndEnglishVal(e) {
	if (e.isValid) {
		if (isChineseAndEnglish(e.value) == false) {
			e.errorText = "必须输入英文或汉字";
			e.isValid = false;
		}
	}
}
function onEnglishAndNumberVal(e) {
    if (e.isValid) {
        if (isEnglishAndNumber(e.value) == false) {
            e.errorText = "必须输入英文+数字";
            e.isValid = false;
        }
    }
}
function onChineseVal(e) {
    if (e.isValid) {
        if (isChinese(e.value) == false) {
            e.errorText = "必须输入中文";
            e.isValid = false;
        }
    }
}
function onValidateIDCard(e) {
	if (e.isValid) {
        if (isIDCard(e.value) == false) {
            e.errorText = "必须正确身份证号码";
            e.isValid = false;
        }
	}
}
function onIDCardsVal(e) {
    if (e.isValid) {
        var pattern = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
        if (e.value.length < 15 || e.value.length > 18 || pattern.test(e.value) == false) {
            e.errorText = "必须输入合法的身份证";
            e.isValid = false;
        }
    }
}
function onPhoneVal(e) {
    if (e.isValid) {
    	var pattern = /(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}/;
    	//console.log("{} "+pattern.test(e.value));
        if (pattern.test(e.value) == false) {
            e.errorText = "必须输入合法的手机号码";
            e.isValid = false;
        }
    }
}
function onTelPhoneVal(e) {
    if (e.isValid) {
    	var pattern = /^\d{3}-\d{8}|\d{4}-\d{7}$/;
        if (pattern.test(e.value) == false) {
            e.errorText = "必须输入合法的电话号码";
            e.isValid = false;
        }
    }
}

function onAddressVal(e) {
    if (e.isValid) {
        if (e.value.charAt(5) == '0') {
            e.errorText = "必须选择区县或者街道/居委会";
            e.isValid = false;
        }
    }
}

//身份证号码校验
function isIdCard(card){
	var pattern = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
    if (card.length < 15 || card.length > 18 || pattern.test(card) == false) {
    	mini.alert("必须输入合法的身份证");
    	return false;
    }
    return true;
}
//联动地址校验
function isAddressVal(str,qx,lu) {
	if(qx.charAt(5) == '0') {
		mini.alert(str+"必须选择到区县或者街道");
        return false;
    }
	//不填写路
	if(lu == null || lu == '') {
		if(qx.charAt(8) == '0'){
			mini.alert(str+"路为空，必须选择到街道");
	        return false;
		}
    }
	return true;
}
//电话号码二选一校验
function isPhones(sj,dh){
	var psj = /(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}/;
	var pdh = /^\d{3}-\d{8}|\d{4}-\d{7}$/;
	if((sj == null || sj == '') && (dh == null || dh == '')){
		mini.alert("手机号码和电话号码请二选一!");
		return false;
	}
	if(sj != null && sj != '' && dh != null && dh != ''){
        if (psj.test(sj) == false) {
        	mini.alert("请填写正确格式的手机号码!");
			return false;
        }
        if (pdh.test(dh) == false) {
        	mini.alert("请填写正确格式的电话号码!");
			return false;
        }
	}
	if(sj != null && sj != '' && (dh == null || dh == '')){
        if (psj.test(sj) == false) {
        	mini.alert("请填写正确格式的手机号码!");
			return false;
        }
	}
	if((sj == null || sj == '') && dh != null && dh != ''){
        if (pdh.test(dh) == false) {
        	mini.alert("请填写正确格式的电话号码!");
			return false;
        }
	}
	return true;
}

////////////////////////////////////
/* 是否英文 */
function isEnglish(v) {
    var re = new RegExp("^[a-zA-Z\_]+$");
    if (re.test(v)) return true;
    return false;
}
/* 是否英文+数字 */
function isEnglishAndNumber(v) {
    var re = new RegExp("^[0-9a-zA-Z\_]+$");
    if (re.test(v)) return true;
    return false;
}
/* 是否汉字 */
function isChinese(v) {
    var re = new RegExp("^[\u4e00-\u9fa5]+$");
    if (re.test(v)) return true;
    return false;
}
/* 是否汉字或英文*/
function isChineseAndEnglish(v){
	var reg = new RegExp("^[\u4E00-\u9FA5a-zA-Z\_]+$"); 
	if(!reg.test(v)) return false; 
	return true; 
}
/* 身份证严格验证*/
function isIDCard(v){
	//18位身份证号码的正则表达式
	var regIdCard = /^(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	// 如果通过该验证，说明身份证格式正确，但准确性还需计算
	if (regIdCard.test(v)) {
		// 将前17位加权因子保存在数组里
		var idCardWi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10,5, 8, 4, 2); 
		// 这是除以11后，可能产生的11位余数、验证码，也保存成数组
		var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); 
		// 用来保存前17位各自乖以加权因子后的总和
		var idCardWiSum = 0; 
		for (var i = 0; i < 17; i++) {
			idCardWiSum += v.substring(i, i + 1) * idCardWi[i];
		}
		// 计算出校验码所在数组的位置
		var idCardMod = idCardWiSum % 11;
		// 得到最后一位身份证号码
		var idCardLast = v.substring(17);
		// 如果等于2，则说明校验码是10，身份证号码最后一位应该是X
		if (idCardMod == 2) {
			if (idCardLast == "X" || idCardLast == "x")	return true;
			return false;
		} else {
			// 用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
			if (idCardLast == idCardY[idCardMod]) return true;
			return false;
		}
	}
	return false;
}

/*自定义vtype*/
mini.VTypes["englishErrorText"] = "请输入英文";
mini.VTypes["english"] = function (v) {
    var re = new RegExp("^[a-zA-Z\_]+$");
    if (re.test(v)) return true;
    return false;
}
