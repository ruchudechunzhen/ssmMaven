<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <meta name="author" content="舒涛">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="icon" href="favicon.png" type="image/png" />
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
    <script type="text/javascript">
    
       $(function(){
          
          //div 两个哪个显示呢？
          if(null!="${sessionScope.userAccount}" && "${sessionScope.userAccount}" !=""){
               $("#regBlock").css("display","none");
	           $("#userBlock").css("display","block");
          }else{
               $("#regBlock").css("display","block");
	           $("#userBlock").css("display","none");
          }
          
       });
    </script>
</head>

<body class="w100">
    <header>
        <div class="container">
            <span>欢迎来到IT培训的黄埔军校——智游教育！</span>
            
            
	            <div id="regBlock" style="display:none;float:right">
	            	
	               <a href="login.jsp" target="_blank"><img src="${pageContext.request.contextPath}/img/we.png">进入后台</a>
	               <a href="javascript:;" id="reg_open"><img src="${pageContext.request.contextPath}/img/we.png">注册</a>
	               <a href="javascript:;" id="login_open"><img src="${pageContext.request.contextPath}/img/we.png">登录</a>
	            </div>
            
	            <div id="userBlock" style="display:none;float:right">
	               
	               <a href="javascript:;" id="loginout">退出</a>
	               <a href="user/showMyProfile.do" id="account"></a>
	            </div>
           
            <a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/img/sc.png" draggable="false">加入收藏</a>
            <a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2580094677&site=qq&menu=yes"><img src="${pageContext.request.contextPath}/img/we.png" draggable="false">联系我们</a>
            <a class="color_e4"><img src="${pageContext.request.contextPath}/img/phone.png" draggable="false"> 0371-88888598&#x3000;&#x3000;4006-371-555</a>

        </div>
    </header>
    <!--banner图-->
    <div class="banner index-banner"></div>

    <!--模块化课程-->
    <div class="course">
        <div class="container">
            <p class="title">模块化课程，从入门到精通，大神并不遥远</p>
            <div class="course-info">
                <table cellspacing="10">
                    <tr>
                        <td colspan="2">
                            <a href=<c:url value="/webVideo/list.do?id=1" /> >
                                <img src="${pageContext.request.contextPath}/img/html5.jpg" alt="" class="image scale" draggable="false">
                                <div class="headline">
                                    <span>Web前端教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                        <td>
                            <!--上线时修改id-->
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/img/ui.jpg" alt="" class="image scale" draggable="false">
                                <div class="headline">
                                    <span>UI设计教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                        <td rowspan="2" class="one_three">
                            <a href="#" class="opacity5">
                                <img src="${pageContext.request.contextPath}/img/java.jpg" alt="" class="image" draggable="false">
                                <div class="headline">
                                    <span>Java教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#" class="opacity5">
                                <img src="${pageContext.request.contextPath}/img/bigdata.jpg" alt="" class="image" draggable="false">
                                <div class="headline">
                                    <span>大数据教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                        <td colspan="2">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/img/python.jpg" alt="" class="image scale" draggable="false">
                                <div class="headline">
                                    <span>Python教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/img/php.jpg" alt="" class="image scale" draggable="false">
                                <div class="headline">
                                    <span>PHP教程</span>
                                    <img src="${pageContext.request.contextPath}/img/arrow.png" alt="">
                                </div>
                            </a>
                        </td>
                        <td colspan="2" class="three_two">
                            <img src="${pageContext.request.contextPath}/img/qidai.jpg" alt="" class="image" draggable="false">
                            <div class="headline">
                                更多课程，敬请期待...
                            </div>
                        </td>
                    </tr>
                </table>
                <!--马上试听-->
                <a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2580094677&site=qq&menu=yes">
                    <div class="audition">高级课程</div>
                </a>
            </div>
        </div>
    </div>


    <!--报名表单-->
    <div class="form_area">
        <div class="container">
            <p class="title"><b>这个世界上可以选择的很多，可以改变命运的选择很少<br />你现在准备好向梦想出发了吗？</b></p>
            <form id="iform" action="/090/plus/dmail.php" enctype="multipart/form-data" method="post">
                <div class="form_line1"></div>
                <div class="form_line2"></div>
                <div class="wrap">
                    <input type="hidden" name="action" value="post" />
                    <input type="hidden" name="diyid" value="3" />
                    <input type="hidden" name="do" value="2" />
                    <input type="hidden" name="ip" value="" />
                    <input type="hidden" name="time" value="" />
                    <div><label for="name">姓名：</label><input name="name" id="name" type="text" class="form-control" /></div>
                    <div><label for="tel">手机号：</label><input name="tel" id="tel" type="text" class="form-control" /></div>
                    <div><label for="qq">QQ：</label><input name="qq" id="qq" type="text" class="form-control" /></div>
                </div>
                <input class="button" type="submit" value="立即报名" />
            </form>
        </div>
    </div>
    <!--页脚-->
    <footer>
        <ul>
            <li>
                <img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" draggable="false">
            </li>
            <li class="mt25">
                <h3>各校区地址</h3>
                <ul>
                    <li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层</li>
                    <li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路</li>
                    <li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼</li>
                    <li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层</li>
                    <li>西安分校<br>中国-西安莲湖区&#X3000;联系人：梁老师 13201570801</li>
                </ul>
            </li>
            <li class="mt25">
                <h3>联系我们</h3>
                <ul id="foo_icon">
                    <li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
                    <li>e-mail:zy@zhiyou100.com</li>
                    <li>电话:4006-371-555 0371-88888598</li>
                    <li class="erwei">
                        <br>
                        <div>
                            <img class="weixin" src="${pageContext.request.contextPath}/img/微信公众号.png" alt="" draggable="false">
                            <img class="weibo" src="${pageContext.request.contextPath}/img/微博公众号.png" alt="" draggable="false">
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="record">智游教育 &copy; 豫ICP备17000832号-1 &#X3000;河南智游臻龙教育科技有限公司</div>
    </footer>

    <!--登录注册弹出框-->
    <div class="mask hidden" id="login">
        <div class="mask_content">
            <div class="mask_content_header">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
            </div>
            <div class="mask_content_body">
                <form id="loginForm" action="#">
                    <h3>快速登录</h3>
                    <input type="email" id="loginEmail" placeholder="请输入邮箱" name="email">
                    <input type="password" id="loginPassword" placeholder="请输入密码" name="password">
                    <div id="forget">
                        <a href="<c:url value="/user/forgetPassword.do"/>" >忘记密码？</a>
                    </div>
                    <!-- return commitLogin() 中的return是为了让这个点击不提交表单 -->
                    <input type="submit" onclick="return commitLogin()" value="登&#x3000;录">
                </form>
            </div>
            <div class="mask_content_footer">
                <span id="login_close">关&#x3000;闭</span>
            </div>
        </div>
    </div>
    <div class="mask hidden" id="reg">
        <div class="mask_content">
            <div class="mask_content_header">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
            </div>
            <div class="mask_content_body">
                <form id="regForm" action="user/insertUser.action">
                    <h3>新用户注册</h3>
                    <input type="email" id="regEmail" placeholder="请输入邮箱" name="email"><span id="emailMsg"></span>
                    <input type="password" id="regPsw" placeholder="请输入密码" name="password">
                    <input type="password" id="regPswAgain" placeholder="请再次输入密码" name="psw_again"><span id="passMsg"></span>
                    <div id="yzm" class="form-inline">
                        <input type="text" name="yzm" style="width: 45%; display: inline-block;">
                        <div id="v_container" style="width: 45%;height: 40px;float:right;"></div>
                    </div>
                    <input type="submit" onclick="return commitRegForm();" value="注&#x3000;册">
                </form>
            </div>
            <div class="mask_content_footer">
                <span id="reg_close">关&#x3000;闭</span>
            </div>
        </div>
    </div>

    
    
</body>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
</html>
