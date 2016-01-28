Array.prototype.toObjectByKey = function(key){
    if (key === undefined)
    {
        key = "id";
    }
    ObjectData = {};
    this.forEach(function(Element, index){
        ObjectData[Element[key]] = Element;
    });
    return ObjectData;
};
//只能输入整数
function onlyInteger(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/[^\d]/g,'').replace(/^0\d*$/g,'');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}

//只能输入2位金额
function onlyMoney(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1').replace(/^0(\d{1,10}(?:\.\d{0,2})?)*$/g, '');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}
//只能输入3位重量
function onlyWeight(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/^\D*(\d*(?:\.\d{0,3})?).*$/g, '$1').replace(/^0(\d{1,10}(?:\.\d{0,3})?)*$/g, '');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}
//参数说明：num 要格式化的数字 n 保留小数位
function formatMoney(num,n) {  
    if(num&&n){
        num=parseFloat(num);
        num=String(num.toFixed(n));
        var re=/(-?\d+)(\d{3})/;
        while(re.test(num)) 
        num=num.replace(re,"$1,$2")
        return num; 
    }else{
        return "0.00";
    }
}

//分转元
function fToy(money) {
    return (parseFloat(money).div(100));
}

//元转分
function yTof(money) {
    return (parseFloat(money).mul(100));
}

//除法函数，用来得到精确的除法结果
//说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
//调用：accDiv(arg1,arg2)
//返回值：arg1除以arg2的精确结果
function accDiv(arg1,arg2){
    var t1=0,t2=0,r1,r2;
    try{t1=arg1.toString().split(".")[1].length}catch(e){}
    try{t2=arg2.toString().split(".")[1].length}catch(e){}
    with(Math){
        r1=Number(arg1.toString().replace(".",""))
        r2=Number(arg2.toString().replace(".",""))
        return (r1/r2)*pow(10,t2-t1);
    }
}

//给Number类型增加一个div方法，调用起来更加方便。
Number.prototype.div = function (arg){
    return accDiv(this, arg);
}

//乘法函数，用来得到精确的乘法结果
//说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
//调用：accMul(arg1,arg2)
//返回值：arg1乘以 arg2的精确结果
function accMul(arg1,arg2)
{
    var m=0,s1=arg1.toString(),s2=arg2.toString();
    try{m+=s1.split(".")[1].length}catch(e){}
    try{m+=s2.split(".")[1].length}catch(e){}
    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
}

// 给Number类型增加一个mul方法，调用起来更加方便。
Number.prototype.mul = function (arg){
    return accMul(arg, this);
}

function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return (r1 / r2) * pow(10, t2 - t1);
    }
}
//给Number类型增加一个div方法，调用起来更加方便。
Number.prototype.div = function(arg) {
    return accDiv(this, arg);
}
function accMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try { m += s1.split(".")[1].length } catch (e) { }
    try { m += s2.split(".")[1].length } catch (e) { }
    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)
}
Number.prototype.mul = function(arg) {
    return accMul(arg, this);
}
function accAdd(arg1, arg2) {
    var r1, r2, m, c;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    c = Math.abs(r1 - r2);
    m = Math.pow(10, Math.max(r1, r2))
    if (c > 0) {
        var cm = Math.pow(10, c);
        if (r1 > r2) {
            arg1 = Number(arg1.toString().replace(".", ""));
            arg2 = Number(arg2.toString().replace(".", "")) * cm;
        } else {
            arg1 = Number(arg1.toString().replace(".", "")) * cm;
            arg2 = Number(arg2.toString().replace(".", ""));
        }
    } else {
        arg1 = Number(arg1.toString().replace(".", ""));
        arg2 = Number(arg2.toString().replace(".", ""));
    }
    return (arg1 + arg2) / m
}
Number.prototype.add = function(arg) {
    return accAdd(arg, this);
}

//排序方法
function compareInt(x, y){
    var iNum1 = parseInt(x[0]);//强制转换成int型;
    var iNum2 = parseInt(y[0]);
    if(iNum1 < iNum2){
        return -1;
    }else if(iNum1 > iNum2){
        return 1;
    }else{
        return 0;
    }
}