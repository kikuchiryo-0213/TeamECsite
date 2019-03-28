<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/header.css">
<title>ヘッダー</title>
<script>
function goLoginAction(){
	document.getElementById("headerform").action="GoLoginAction";
}
function goMyPageAction(){
	document.getElementById("headerform").action="MyPageAction";
}
function goCartAction(){
	document.getElementById("headerform").action="CartAction";
}
function goProductListAction(){
	document.getElementById("categoryId").value=1;
	document.getElementById("headerform").action="ProductListAction";
}
function goLogoutAction(){
	document.getElementById("headerform").action="LogoutAction";
}
function goSearchItemAction(){
	document.getElementById("headerform").action="SearchItemAction";
}
</script>
</head>
<body>
<header>
<div class="header">
	<s:form id="headerform" name="form">
		<div class="logo"><img src="./images/logo3.png" height="50px"></div>
		<div class="category">
			<s:if test='#session.containsKey("mCategoryList")'>
			<s:select name="categoryId" list="#session.mCategoryList" listValue="categoryName" listKey="categoryId" class="cs-div" id="categoryId"/>
			</s:if>
		</div>

		<div class="serchKeyword">
			<s:textfield name="keywords" class="txt-keywords" placeholder="検索ワード" />
		</div>
		<div class="search_bottan">
			<s:submit value="商品検索" class="submit_btn" onclick="goSearchItemAction();"/>
		</div>
		<div class="login">
			<s:if test="#session.loginFlg==1">
				<s:submit value="ログアウト" class="submit_btn" onclick="goLogoutAction();"/>
			</s:if>
			<s:else>
				<s:submit value="ログイン" class="submit_btn" onclick="goLoginAction();"/>
			</s:else>
		</div>
		<div class="cart">
			<s:submit value="カート" class="submit_btn" onclick="goCartAction();"/>
		</div>
		<div class="productList">
			<s:submit value="商品一覧" class="submit_btn" onclick="goProductListAction();"/>
		</div>
		<div class="myPage">
			<s:if test="#session.loginFlg==1">
				<s:submit value="マイページ" class="submit_btn" onclick="goMyPageAction();"/>
			</s:if>
		</div>
	</s:form>
</div>
</header>
</body>
</html>