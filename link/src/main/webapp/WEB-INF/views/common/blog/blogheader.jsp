<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-sm-12 text-right">
    <span class="blog_detail_title">${blog.title }</span>
</div>
<div class="col-sm-12 blog_detail_header">
    <span class="blog-detail-subtitle">Blog</span>
    <span class="blog-detail-subtitle2"><a href="detail.do?blogNo=${blog.no }">${user.nickName }</a></span>
</div>