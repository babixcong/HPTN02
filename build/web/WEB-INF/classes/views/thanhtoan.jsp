<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Thanh toán">
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="row">
                <div class="col-lg-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${kh != 'null'}">
                                <div class="invoice-area">
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
                                    <div class="invoice-table table-responsive mt-5">
                                        <table class="table table-bordered table-hover text-right">
                                            <thead>
                                                <tr class="text-capitalize">
                                                    <th class="text-center" style="width: 5%;">STT</th>
                                                    <th class="text-left" style="width: 45%; min-width: 130px;">Tên quà</th>
                                                    <th>Số lượng</th>
                                                    <th style="min-width: 100px">Điểm đổi (điểm)</th>
                                                    <th>Tổng số điểm</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${sessionScope.myCartItems}" varStatus="loop">
                                                    <tr id="r-${loop.index + 1}">
                                                        <td class="text-center">${loop.index +  1}</td>
                                                        <td class="text-left">${item.value.getTen()}</td>
                                                        <td>${item.value.getSoluong()}</td>
                                                        <td>${item.value.getDongia()}
                                                        </td>
                                                        <td>${item.value.getDongia() * item.value.getSoluong()}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">Tổng điểm: </td>
                                                    <td id="total">${sessionScope.myCartTotal}
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="invoice-buttons text-right">
                                        <a href="javascript:void(0);" data-empty="${sessionScope.myCartNum}" data-id="${kh.getId()}" id="doiqua" class="invoice-btn">In hóa đơn</a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${kh == 'null'}">
                                <div class="invoice-area">
                                    <div class="invoice-head">
                                        <div class="row">
                                            <div class="iv-left col-6">
                                                <span>Giỏ hàng</span>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${sessionScope.customer == null}" >
                                        <div class="row align-items-center">
                                            <div class="col-md-6">
                                                <div class="invoice-address">
                                                    <h5>Loại khách hàng: Khách vãng lai</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.customer != null}" >
                                        <div class="row align-items-center">
                                            <div class="col-md-6">

                                                <div class="invoice-address">
                                                    <h5>Họ tên:  ${sessionScope.customer.getHoten().toString()}</h5>
                                                    <h5>Địa chỉ: ${sessionScope.customer.getDiachi().toString()}</h5>
                                                    <h5>Điểm thưởng hiện tại: ${sessionScope.customer.getDiemhientai()}</h5>
                                                </div>

                                            </div>
                                            <div class="col-md-6 text-md-right">
                                                <ul class="invoice-date">
                                                    <li>DOB: ${sessionScope.customer.getNgaysinh()}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="invoice-table table-responsive mt-5">
                                        <table class="table table-bordered table-hover text-right">
                                            <thead>
                                                <tr class="text-capitalize">
                                                    <th class="text-center" style="width: 5%;">STT</th>
                                                    <th class="text-left" style="width: 45%; min-width: 130px;">Tên mặt hàng</th>
                                                    <th>Số lượng</th>
                                                    <th style="min-width: 100px">Đơn giá</th>
                                                    <th>Tạm tính</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${sessionScope.myCartItems}" varStatus="loop">
                                                    <tr id="r-${loop.index + 1}">
                                                        <td class="text-center">${loop.index +  1}</td>
                                                        <td class="text-left">${item.value.getLoaiqua().getTen()}</td>
                                                        <td>${item.value.getSoluong()}</td>
                                                        <td><fmt:formatNumber value = "${item.value.getDongia()}" 
                                                            type = "currency"/>
                                                        </td>
                                                        <td><fmt:formatNumber value = "${item.value.getDongia() * item.value.getSoluong()}" 
                                                            type = "currency"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">Tổng tiền: </td>
                                                    <td id="total">
                                                    <fmt:formatNumber value = "${sessionScope.myCartTotal}" 
                                                            type = "currency"/>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="invoice-buttons text-right">
                                        <a href="${pageContext.request.contextPath}/invoices.html" data-empty="${sessionScope.myCartNum}" id="print-invoice" class="invoice-btn">In hóa đơn</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
    <jsp:attribute name="extra_js">
        <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#print-invoice').on('click', function(event) {
                    event.preventDefault();
                    $.ajax({
                        type: 'post',
                        url: 'create.html',
                        mimeType:"text/html; charset=UTF-8",
                        dataType: 'json',
                        data: { 
                        }
                    }).done(function(response) {
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            title: 'Thanh toán thành công',
                            confirmButtonText: 'Xác nhận',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "index.html";
                            }
                        });
                    });
                });
                
                $('#doiqua').on('click', function(event) {
                    event.preventDefault();
                    let id =$(this).data('id');
                    $.ajax({
                        type: 'post',
                        url: 'gift/exchange/create.html',
                        mimeType:"text/html; charset=UTF-8",
                        dataType: 'json',
                        data: { 
                            id:id
                        }
                    }).done(function(response) {
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            title: 'Thanh toán thành công',
                            confirmButtonText: 'Xác nhận',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "index.html";
                            }
                        });
                    });
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            