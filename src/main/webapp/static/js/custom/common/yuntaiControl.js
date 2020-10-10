/**
 * 云台控制
 * @param type
 */
function yuntaiControl(type,deviceSerial) {
    debugger
    let accessToken = '';
    //获取accessToken
    // return;
    $.post('https://open.ys7.com/api/lapp/token/get',
        {appKey:'941c26f6280e4e7c98df25150ed2c103',appSecret:'5dfb720651c895aec2d9a21607487647'},function (result) {
            accessToken = result.data.accessToken;
            //开始控制
            $.post('https://open.ys7.com/api/lapp/device/ptz/start',{accessToken:accessToken,deviceSerial:deviceSerial,channelNo:'1',
                direction:type,speed:1},function (data) {
                console.log(data);
                setTimeout(function () {
                    //停止
                    $.post('https://open.ys7.com/api/lapp/device/ptz/stop',{accessToken:accessToken,deviceSerial:deviceSerial,channelNo:'1',
                        direction:type},function (data) {
                        console.log(data);
                    })
                },100);
            })
        })
}