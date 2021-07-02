<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Giỏ hàng">
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
                                                    <th>Hành động</>
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
                                                        <td>
                                                            <button type="button" data-code="${item.value.getCode()}" data-kind="QUA" class="btn btn-danger remove-item" data-value="${loop.index + 1}">Xóa</button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">Tổng điểm: </td>
                                                    <td id="total" data-total="${sessionScope.myCartTotal}">${sessionScope.myCartTotal}
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="invoice-buttons text-right">
                                    <a href="${pageContext.request.contextPath}/index.html" class="invoice-btn">Tiếp tục chọn quà</a>
                                    <c:if test="${sessionScope.myCartItems != null && sessionScope.myCartNum != 0}">
                                        <a href="${pageContext.request.contextPath}/invoices.html?id=${kh.getId()}" data-empty="${sessionScope.myCartNum}" id="doi" data-id="${kh.getId()}" class="invoice-btn">Đổi quà</a>
                                    </c:if>   `
                                </div>
                            </c:if>
                            <c:if test="${kh == 'null'}">
                                <div class="invoice-head">
                                    <div class="row">
                                        <div class="iv-left col-6">
                                            <span>Giỏ hàng</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center">
                                    <form class="form-inline mr-auto" id="search-form">
                                        <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Nhập mã khách hàng" aria-label="Search">
                                        <button class="btn btn-unique btn-rounded btn-sm my-0" id="search" type="submit">Tìm kiếm</button>
                                        <div class="text-danger" id="error-keyword"></div>
                                    </form>
                                </div>
                                <br>
                                <div id="customer-area">
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
                                                    <h5 id="the">
                                                        <c:if test="${sessionScope.the != null}">
                                                            Mã thẻ thân thiết: ${sessionScope.the.getMathe()}
                                                        </c:if>
                                                    </h5>
                                                    <h5>DOB: ${sessionScope.customer.getNgaysinh()}</h5>
                                                    <h5>Địa chỉ: ${sessionScope.customer.getDiachi().toString()}</h5>
                                                    <h5>Điểm thưởng hiện tại: ${sessionScope.customer.getDiemhientai()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="invoice-table table-responsive mt-5">
                                    <table class="table table-bordered table-hover text-right">
                                        <thead>
                                            <tr class="text-capitalize">
                                                <th class="text-center" style="width: 5%;">STT</th>
                                                <th class="text-left" style="width: 45%; min-width: 130px;">Tên mặt hàng</th>
                                                <th>Số lượng</th>
                                                <th style="min-width: 100px">Đơn giá</th>
                                                <th>Tạm tính</th>
                                                <th>Hành động</>
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
                                                    <td>
                                                        <button type="button" data-code="${item.value.getCode()}"  data-kind="MUA" class="btn btn-danger remove-item" data-value="${loop.index + 1}">Xóa</button>
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
                                </div>
                                <div class="invoice-buttons text-right">
                                    <a href="${pageContext.request.contextPath}/index.html" class="invoice-btn">Tiếp tục chọn hàng</a>
                                    <c:if test="${sessionScope.myCartItems != null && sessionScope.myCartNum != 0}">
                                        <a href="${pageContext.request.contextPath}/invoices.html" data-empty="${sessionScope.myCartNum}" id="pay" class="invoice-btn">Thanh toán</a>
                                    </c:if>   
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
                $('.remove-item').on('click', function() {
                    let index = $(this).data('value');
                    let code = $(this).data('code');
                    let kind = $(this).data('kind');
                    let row = '#r-' + index;
                    $.ajax({
                        type: 'get',
                        url: 'cart/remove.html',
                        mimeType:'text/html; charset=UTF-8',
                        dataType: 'json',
                        data: {
                            code: code,
                            kind: kind
                        }
                    }).done(function(response) {
                        console.log(response);
                        if (response[0] == 200) {
                            $(row).remove();
                            $('#cartNum').html(response[2]);
                            $('#total').html(response[1]);
                            if (response[2] == 0) {
                                $('#pay').remove();
                            }
                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        // If fail
                    });
                });
                
                $('#search-form').validate({
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    rules: {
                        "keyword": {
                            required: true,
                            minlength: 1,
                        },
                    },
                    messages: {
                        "keyword": {
                            required: "Hãy nhập Mã tìm kiếm",
                            minlength: "Hãy nhập Mã tìm kiếm",
                        },
                    },
                    errorPlacement: function(error, element) {
                        if (element.attr('name') == 'keyword') {
                            $("#error-keyword").text($(error).text());
                        }
                    }
                });
                
                $('#search-form').on('submit', function(event) {
                    event.preventDefault();
                    let keyword = $('#search-form input[name=keyword]').val();
                    if ($(this).valid()) {
                        $.ajax({
                            type: 'get',
                            url: 'customers/search.html',
                            mimeType:'text/html; charset=UTF-8',
                            dataType: 'json',
                            data: {
                                code: keyword,
                            }
                        }).done(function(response) {
                            $("#customer-area").load(location.href + " #customer-area");
                            $("#the").load(location.href + " #the");
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            Swal.fire(jqXHR.responseText);
                            $("#customer-area").load(location.href + " #customer-area");
                            $('#search-form input[name=keyword]').val('');
                            $("#the").load(location.href + " #the");
                        });
                    }
                });
                
                $('#doi').on('click', function(event) {
                    event.preventDefault();
                    let currentPoint = $('#current-point').data('value');
                    let total = $('#total').data('total');
                    let minus = currentPoint - total;
                    if (minus < 0) {
                        Swal.fire("Điểm không đủ để đổi quà");
                        return;
                    }
                    let id = $(this).data('id');
                     $.ajax({
                       type: 'get',
                       url: 'invoices.html',
                       mimeType:'text/html; charset=UTF-8',
                       dataType: 'json',
                       data: {
                           id: id,
                       }
                    }).done(function(response) {
                       
                        window.location.href = "invoices.html?id=" + id;
                    }).fail(function(response) {
                        window.location.href = "invoices.html?id=" + id;
                    });
                });
//                    
//                   
//                };
            });
        </script>
    </jsp:attribute>
</mt:layout>
            