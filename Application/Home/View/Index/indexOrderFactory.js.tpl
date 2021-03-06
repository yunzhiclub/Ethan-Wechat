app.factory('OrderFactory' ,function($ionicPopup,$http){
    var titles = {"all":"全部订单", 
                    "toBeStay":"待入住", 
                    "toBeEvaluation":"待评价",
                    "toBePaid":"待支付"
                }; //根据传入的type值，显示不同的TITLE
    var time            = {:strtotime(date("Y-m-d"))};  //取当日0时时间戳
    var datas           = {:$M->getOrders()};           //实始化订单数据
    var toBeStay        = new Array();                  //待入住
    var toBeEvaluation  = new Array();                  //待评论
    var toBePaid        = new Array();                  //待支付

    var init = function(datas){
        datas.forEach(function(Element, index){
            // console.log(Element.is_cancel);
            // console.log(Element.is_pay);
            // console.log(Element.begin_time);
            // console.log(time);
            //如果未取消，未支付，且入住时间是今天或以后，则为待支付订单
            if (Element.is_cancel == '0' && Element.is_pay == '0' && Element.begin_time >= time)
            {
                Element.toBePaid        = 1;
                Element.toBeEvaluation  = 0;
                toBePaid.push(Element);
            }
            //如果已支付，则按情况查看是否为待评价或待入住
            else if (Element.is_pay == '1')
            {
                //如果状态主正常，且开始入住时间大于等于当前时间，则为未入住
                if (Element.is_cancel == '0' && Element.begin_time >= time)
                {
                    Element.toBeStay     = 1;
                    toBeStay.push(Element);
                }
                else
                {
                     Element.toBeStay     = 0;
                }

                //如果未评价，当前时间大于离店时间，则为可评价订单
                if (Element.is_evaluation == 0 && Element.end_time < time)
                {
                    Element.toBeEvaluation  = 1;
                    toBeEvaluation.push(Element);
                }
                else
                {
                    Element.toBeEvaluation  = 0;
                }

                Element.toBePaid        = 0;
            }
        });
    };

    init(datas);//进行数据的初始化，来将几类订单进行分类.该项操作也可以在PHP中计算好后，传给前台。
    
    var orderIsPay = function(id){
        datas.forEach(function(Element, index){
            if (Element.id == id)
            {
                Element.toBeStay = 1;
                Element.toBePaid = 0;
                toBeEvaluation.pop(Element);
            }
        });
    };

    var orderIsEvaluationed = function(id){
        datas.forEach(function(Element, index){
            if (Element.id == id)
            {
                Element.toBeEvaluation = 0;
                Element.toBePaid = 0;
                toBePaid.pop(Element);
                toBeStay.push(Element);
            }
        });
    };
    //数据初始化
    var initDatas = function(){
        $http.get("__ROOT__/api.php/Order/getRecentListsBySessionOpenId")
        .success(function(data){
            if(data.status == "success")
            {
                datas = data.data;
                init(datas);
            }
            else
            {
                $ionicPopup.alert({
                    title: '系统错误',
                    template: '网络错误，请稍后重试',
                });
                if (data.message !== undefined)
                {
                    console.log(data.message);         
                }
            }
        })
        .error(function(){
           $ionicPopup.alert({
                title: '系统错误',
                template: '网络错误，请稍后重试',
            }); 
        });
    };

    //添加订单
    //接收订单信息，进行请求添加，返回订单编号
    var addOrder = function(order, callBack){
        $http.get('api.php/Api/Order/addList',{params:order})
        .success(function(data){
            if (data.status ==='success') {
                var order_time = Date.parse(new Date())/1000;
                order.id                = data.order_id;
                order.order_time        = order_time;
                order.begin_time_str    = order.begin_time;
                order.end_time_str      = order.end_time;
                datas.push(order);
                toBePaid.push(order);
             }
             callBack(data);
             return;
        })
        .error(function(){
            $ionicPopup.alert({
                title: '系统错误',
                template: '网络不给力，请稍后重试.',
            });
        });
    };
    var orderInfo = {};
    orderInfo.customerName  = '{:$M->orderInfo["customer_name"]}';
    orderInfo.customerPhone = '{:$M->orderInfo["customer_phone"]}';
    orderInfo.notice = '{:$M->orderInfo["notice"]}';
    orderInfo.prompt = '{:$M->orderInfo["prompt"]}';
    orderInfo.credit = '{:$M->orderInfo["credit"]}';
    return {
        title: function(type){
            return titles[type];        //页面标题
        },
        datas: datas,                   //全部订单数据 
        toBePaid: toBePaid,             //待支付
        toBeEvaluation: toBeEvaluation, //待评论
        toBeStay: toBeStay,             //待入住
        orderIsPay:orderIsPay,          //改变订单状态为已支付
        orderInfo: orderInfo,           //预订时的信息
        initDatas:initDatas,            //订单初始化
        addOrder: addOrder,             //添加订单
        orderIsEvaluationed: orderIsEvaluationed,//订单变为已评价
    };
});