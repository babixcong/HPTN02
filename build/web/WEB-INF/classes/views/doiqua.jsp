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
                            <h4 class="header-title">Khách hàng</h4>
                            <div class="data-tables datatable-primary">
                                <table id="table-khachhang" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã</th>
                                            <th>Họ tên</th>
                                            <th>Địa chỉ</th>
                                            <th>Email</th>
                                            <th>Điện thoại</th>
                                            <th>Điểm hiện tại</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="q" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${q.getMakh()}</td>
                                            <td>${q.getHoten().toString()}</td>
                                            <td>${q.getDiachi().toString()}</td>
                                            <td>${q.getEmail()}</td>
                                            <td>${q.getDienthoai()}</td>
                                            <td class="current-point-${q.getId()}" data-value="${q.getDiemhientai()}">${q.getDiemhientai()}</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <button type="button" data-value="${q.getId()}" class="btn btn-primary exchange">Chọn</button>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-khachhang').DataTable({
                    columnDefs: [ { orderable: false, targets: [3, 1,4, 5, 7] }],
                });
                
                $('.exchange').on('click', function() {
                    let id = $(this).data('value');
                    let currentPoint = $('.current-point-' + id).data('value');
                    if (currentPoint == 0) {
                        Swal.fire('Không đủ điều kiện đổi quà');
                        return;
                    }
                    $.ajax({
                        type: 'get',
                        url: 'gifts/exchange/detail.html',
                        mimeType:'text/html; charset=UTF-8',
                        dataType: 'json',
                        data: {
                            id: id,
                        }
                    }).done(function(response) {
                        window.location.href = "gifts/exchange/detail.html?id=" + id;
                    }).fail(function(response) {
                        window.location.href = "gifts/exchange/detail.html?id=" + id;
                    })
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            