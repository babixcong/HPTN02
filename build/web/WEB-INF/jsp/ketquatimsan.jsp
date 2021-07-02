<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Kết quả tìm kiếm">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
        
    </jsp:attribute>
    <jsp:attribute name="content">
        <c:if test="${sessionScope.KhachHang != null}">
            <input type="hidden" name="existed-customer" id="existed-customer"/>
        </c:if>
        <div class="main-content-inner">
            <div class="row" style="margin-top: -50px">
               <div class="col-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Danh sách sân</h4>
                            <div class="data-tables datatable-primary">
                                <table id="table-ve" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sân</th>
                                            <th>Tên sân</th>
                                            <th>Loại sân</th>
                                            <th>Đơn giá</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="san" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${san.getMaSan()}</td>
                                            <td style="text-align: left">${san.getTen()}</td>
                                            <c:if test="${san.getLoaisan() == 'vua'}">
                                                <td>Vừa</td>
                                            </c:if>
                                            <c:if test="${san.getLoaisan() != 'vua'}">
                                                <td>${san.getLoaisan()}</td>
                                            </c:if>
                                            <td style="text-align: right">
                                                <fmt:formatNumber value = "${san.getGiathue()}" 
                                                   type = "currency"/>
                                            </td>
                                            <td style="width: 150px">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <button type="button" data-value="${san.getId()}" class="add-to-cart btn btn-warning ">Chọn sân</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
    <jsp:attribute name="extra_js">
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-ve').DataTable( {
                    columnDefs: [ { orderable: false, targets: [3, 5] }],
                });
                
                $('.add-to-cart').on('click', function (event) {
                    event.preventDefault();
                    let id = $(this).data('value');
                    let existedCustomer = $("#existed-customer");
                    console.log(existedCustomer.length)
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        url: "booking/select.html",
                        data: {
                            id: id
                        }
                    }).done(function(response) {
//                        if (response[2] == "200") {
                            if (existedCustomer.length == 0) {
                                window.location.href = "customers/search.html";
                            } else {
                                window.location.href = "booking/create.html";
                            }
//                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                    });
                })
            });
        </script>
    </jsp:attribute>
</mt:layout>
            