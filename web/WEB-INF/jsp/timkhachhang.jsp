<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Danh sách khách hàng">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
        
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="row" style="margin-top: -50px">
               <div class="col-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row" style="margin-bottom: 15px">
                                <div class="col-8">
                                    <h4 class="header-title">Danh sách khách hàng</h4>
                                </div>
                                <div class="col-4">
                                    <a type="button" href="${pageContext.request.contextPath}/customers/create.html" class="btn btn-info"  style="float:right">Thêm mới khách hàng</a>
                                </div>
                            </div>
                            <div class="data-tables datatable-primary">
                                <table id="table-ve" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã KH</th>
                                            <th>Họ tên</th>
                                            <th>Địa chỉ</th>
                                            <th>Email</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="kh" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${kh.getMaKH()}</td>
                                            <td style="text-align: left">${kh.getHoten()}</td>
                                            <td style="text-align: left">${kh.getDiaChi().toString()}</td>
                                            <td style="text-align: left">${kh.getEmail()}</td>
                                            <td style="width: 150px">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <button type="button" data-value="${kh.getId()}" class="add-to-gift btn btn-warning ">Chọn</button>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-ve').DataTable( {
                    columnDefs: [ { orderable: false, targets: [3, 4, 5] }],
                });
                 
                $(".add-to-gift").on("click", function(event) {
                    event.preventDefault();
                    let id = $(this).data("value");
                    
                    $.ajax({
                        type:  "post",
                        dataType: "json",
                        url: "customers/add.html",
                        data: {
                            id: id,
                        }
                    }).done(function(response) {
                        window.location.href = "booking/create.html";
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        
                    });
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            