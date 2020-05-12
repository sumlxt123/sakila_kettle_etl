//-----------------------------------------------------
//--注意需要根据定义修改 hours24(对应序列值)
//--需要在前一步定义这些变量，可以使用生成记录组件生成
//-----------------------------------------------------


// Calculate hours12
//Script here
var hours12 = hours24.getInteger() % 12;
var am_pm = (hours24.getInteger() >= 12 ? "PM" : "AM")





// Calculate Time
var time = ""
        + hours24.getInteger()
        + ":"
        + minutes.getInteger()
        + ":"
        + seconds.getInteger()
        ;

var time_key = (hours24.getInteger() < 10 ? "0": "")
        + hours24.getInteger()
        + (minutes.getInteger() < 10 ? "0": "")
        + minutes.getInteger()
        + (seconds.getInteger() < 10 ? "0": "")
        + seconds.getInteger()
        ;

