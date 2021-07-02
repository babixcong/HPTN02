<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Danh sách quà">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="row">
               <div class="col-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Danh sách quà</h4>
                            <div class="data-tables datatable-primary">
                                <table id="table-qua" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã quà</th>
                                            <th>Tên</th>
                                            <th>Hình ảnh</th>
                                            <th>Loại quà</th>
                                            <th>Số lượng</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="q" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${q.getMaqua()}</td>
                                            <td>${q.getTen()}</td>
                                            <td>
                                                <img src="${q.getLoaiquaInterface().getHinhAnhLoaiQua()}" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'" width="50" class="img-thumbnail"/>
                                            </td>
                                            <td>${q.getLoaiquaInterface().getLoai()}</td>
                                            <td>${q.getSoluong()}</td>
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
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-qua').DataTable({
                    columnDefs: [ { orderable: false, targets: [6, 3] }],
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            