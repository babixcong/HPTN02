<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Chi tiết đổi quà">
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
                            <div id="customer-area">
                                <c:if test="${kh != null}" >
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="invoice-address">
                                                <h5>Họ tên:  ${kh.getHoten().toString()}</h5>
                                                <h5>DOB: ${kh.getNgaysinh()}</h5>
                                                <h5>Địa chỉ: ${kh.getDiachi().toString()}</h5>
                                                <h5 id="current-point" data-value="${kh.getDiemhientai()}">Điểm thưởng hiện tại: ${kh.getDiemhientai()}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <h4 class="header-title">Danh sách quà</h4>
                            <div class="data-tables datatable-primary">
                                <table id="table-qua" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã quà</th>
                                            <th>Tên</th>
                                            <th>Điểm đổi</th>
                                            <th>Hình ảnh</th>
                                            <th>Loại quà</th>
                                            <th>Số lượng</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="q" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${q.getMaqua()}</td>
                                            <td>${q.getTen()}</td>
                                            <td>${q.getDiemdoi()}</td>
                                            <td>
                                                <img src="${q.getLoaiquaInterface().getHinhAnhLoaiQua()}" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'" width="50" class="img-thumbnail"/>
                                            </td>
                                            <td>${q.getLoaiquaInterface().getLoai()}</td>
                                            <td>${q.getSoluong()}</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <button type="button" data-value="${q.getId()}" data-kh="${kh.getId()}" data-code="${q.getMaqua()}" data-kind="QUA" class="btn btn-primary exchange-gift">Đổi quà</button>
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
                $('#table-qua').DataTable({
                    columnDefs: [ { orderable: false, targets: [6, 3] }],
                });
                
                $('.exchange-gift').on('click', function() {
                    let kind = $(this).data('kind');
                    let id = $(this).data('value');
                    let code = $(this).data('code');
                    let kh = $(this).data('kh');
                    $.ajax({
                        type: 'get',
                        url: 'cart/add.html',
                        mimeType:"text/html; charset=UTF-8",
                        dataType: 'json',
                        data: {
                            id: id,
                            kind: kind,
                            code: code,
                        }
                    }).done(function(response) {
                        if (response[0] == 500) {
                            Swal.fire(response[1]);
                        }
                        if (response[0] == 200) {   
                            Swal.fire({
                                title: response[1],
                                confirmButtonText: 'Xác nhận',
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = "cart/show.html?id=" + kh;
                                }
                            });
//                            $('#cartNum').html(response[2]);
                            
                        }
                    }).fail(function(response) {
                        Swal.fire("Hãy thử lại sau");
                    });
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            