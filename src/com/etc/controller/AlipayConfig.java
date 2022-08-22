package com.etc.controller;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000121624609";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCyQGN4gUD9+3RgdPfnbI+MIZRv1USPicHvGnP1aTi2tuSzSTx7p6k4QmE16tnKptJRHYPC68DDDar9acgnY0w/DEz16YRcLXhAJwwwfoImvo1IQTt485N+tErqG0c68MWa8SpRCJPxGWvyHfzgNdmYEK+uw3NDq36nn2+HzYrAKQxJEqV3886JKEYbgjcXjLmdvg74+MLgxKd4ttXHqYWFgXc81GNsmciAXLWe2P50F9oRoU42f0g57BD1KWnuxOf8nm+NMX0YF7/YRoe9F1R7APr6jcpRtgEL4fuAx5WF8mHFUEy8ln1qaE4B0WYlYIlyZYtjL2pHa4/Ex+/+QshZAgMBAAECggEAHCBG0cvrWmgj+9hZCZ46pEzkJCVNtSxyemz9IRsiRMplGdkTfxt8exEWT7Cn/u8FvqDempIij2SHt4bKe1SSwlwJhL/9D6JpGA5RQRGlLcHhfyYz4Sjl/BcsvvXg7m7xbzpgh/rHhUKSotiSfzpgBDuVzQiwFlxoFsD0k0QegaV0tiEfmYLJ1UtJijaAyJiz1E2177vpxIp2RinVt9q7s56JOQtoJmeIWuXrSD+h2R52oFTP9zhGkSNHfyh91LoihMKAeF5Wa8M8Pszy6QZgOm2Kd73cjyU5MFJFteXfTdjVZYTonFQC9cSlu/ZGE4Z98r+5sqURd7MPL9hcNOZkBQKBgQDsRSF3yJ9O51OnCMy/uVgDgSceQAv33B9aWLxSV+vo0/9BhEdx3BCDSwKHFrMo9JwTuvrGI1ymeMcIefTe/aNC/rgG2Vz5EDVty1ycbYCzqAh3tUGOerEYKLNs3BM+t80ZhbbZ0k1tyGkQ3F8FfPN3ap9hriay92F3z9P/PBOAxwKBgQDBIvcaEARH+qBwsWraMNdYu4iNHmDJUtGkvrwoC7Dytg7NVgG8ndaDtMnZ0DB6AbEBjztB13e/ZtbWqWZgYZkV1Nq38vZWYOoeT1QtqDtfOdyXPdzmO+3nPXR3hGiOdpsKJu9fhoddRcQ7uFkAfItvIY2PXsQKZiIiYaRmEeiN3wKBgGxmOzitvwmAcIzOKMI90veopb3nPJZ3U5sr4xsUY5Pqz83LVswSXzEdlQdNjt1XfNRAkRWe27804nwtF//G9sSiAOSDjXhny1uYVeEfDFFg4qGpc25fNCkVY1yqi9nWki8HfiDpr8SSkkG+GYp3DWzYak9yiybJANrrayRK99e5AoGAXhgj3Q26mDrRmbXGQiETeYZ8I4yOSOdRffry/mubvNPX6FAjrnoTfb1Brh2Q0JAsZX8btps8GwMGXjTPzNsf0xQNrxruyuySg0vQziGtM1qkTwbzrTO7VzKIoIXgzq+YH10SuC55moaX8SSCMAt9fxoQtq3Lwuk5bhi2GIhXDW8CgYBWjpyv6X1HrC5isOkWIuXjqctRgXJOdobacwJd1MwSJccPVoGoV4pmK9Xptn247+DICavow5N2o/FVz8ydwR5Pv+4DQcbXEuyfZWUJK7N8GDj2Z5CaaNT/sz5oY/rXxls0YW4NG25XWjOE6TDLLZwTLEQWEe8m4pVSKu1kFizmog==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuA/8iNxu9RpwUTvnVPmpye2SjjdQ8cJJ8mwDv5CZU/bPxc6gXSuFyq8qkVzkctBtt953y+IRcXDiuNvGLhm/dS0emotrMZvBTUn884NHJj+XeGBjchElDMr2fO+btrAAdD7tZrITYhDeh+Zokf9W3zEevcJE5MpG7u+Hy/vp9IIgr4oi9ZrBGQlBDHD5g+F1C0ebXhKN4+pjqj63HLNV+fgoPBt/zz2bmNb4l0dPJJ8+FKwzIZmNzgd5Lrveiqgb6FJ8cDgYCgbpfeIAjlm1KXgoGwI52g9KCzZF1/1rYlpRmWaFZfxy/lpsf7ejOzHMtDn8osgj97gyiW7DXQt02QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://taopiaopiao.nat300.top/cdbs1.0/front/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/cdbs1.0/front/index.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

