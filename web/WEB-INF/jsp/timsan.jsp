<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Tìm sân">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
        
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="row">
                <div class="s002">
                    <form id="search-san" action="booking/search.html" method="get">
                        <div class="inner-form">
                            <div class="input-field second-wrap">
                                <div class="icon-wrap">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                                    </svg>
                                </div>
                                <input type="datetime-local" id="checkin" name="checkin" />
                            </div>
                            <div class="input-field third-wrap">
                                <div class="icon-wrap">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                                    </svg>
                                </div>
                                <input type="datetime-local" id="checkout" name="checkout" />
                            </div>
                            <div class="input-field fouth-wrap">
                                <select id="select-type" name="type" style="width: 100%; height: 70px; padding-left: 10px;">
                                    <option value="all">Tất cả</option>
                                    <option value="To">To</option>
                                    <option value="vua">Vừa</option>
                                    <option value="Mini">Mini</option>
                                </select>
                            </div>
                            <div class="input-field third-wrap">
                                <div class="input-field fifth-wrap">
                                    <button class="btn-search" id="search-btn" type="submit">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
        </div>
    </jsp:attribute>
    <jsp:attribute name="extra_js">
    </jsp:attribute>
</mt:layout>
            
