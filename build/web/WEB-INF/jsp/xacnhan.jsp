<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Đặt sân chi tiết">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="col-md-12">
                <form class="form-horizontal dailyaspirants-login-page lg-container" role="form" action="#" method="post">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">		          	
                                    <label for="Họ" class="control-label">Họ</label>
                                    <input type="text" class="form-control" id="first_name" placeholder="Họ">		            		            		            
                                </div>  
                                <div class="col-md-4">		          	
                                    <label for="Đệm" class="control-label">Đệm</label>
                                    <input type="text" class="form-control" id="last_name" placeholder="Đệm">		            		            		            
                                </div> 
                                <div class="col-md-4">		          	
                                    <label for="Tên" class="control-label">Tên</label>
                                    <input type="text" class="form-control" id="last_name" placeholder="Tên">		            		            		            
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="email" class="control-label">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Email">		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="phone" class="control-label">Điện thoại</label>
                                    <input type="email" class="form-control" id="email" placeholder="Số điện thoại">		            		            		            
                                </div> 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="email" class="control-label">Số nhà</label>
                                    <input type="email" class="form-control" id="email" placeholder="Email">		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="phone" class="control-label">Điện thoại</label>
                                    <input type="email" class="form-control" id="email" placeholder="Số điện thoại">		            		            		            
                                </div> 
                            </div>
                        </div>
                    </div>				    	
                </form>
            </div>
            <div class="data-tables datatable-primary">
                <table id="table-ve" class="text-center">
                    <thead class="text-capitalize">
                        <tr>
                            <th>STT</th>
                            <th>Mã sân</th>
                            <th>Tên sân</th>
                            <th>Giờ bắt đầu</th>
                            <th>Giờ kết thúc</th>
                            <th>Đơn giá</th>
                            <th>Tạm tính</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="ve" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${ve.getMava()}</td>
                            <td>${ve.getTen()}</td>
                            <td><input type="datetime-local" id="checkout" name="checkout" /></td>
                            <td><input type="datetime-local" id="checkout" name="checkout" /></td>
                            <td>
                                <fmt:formatNumber value = "${ve.getDongia()}" 
                                   type = "currency"/>
                            </td>
                            <td>1000000</td>
                            <td style="width: 150px">
                                <div class="row">
                                    <div class="col-12">
                                        <button type="button" data-value="${ve.getId()}" data-code="${ve.getMava()}" data-kind="MUA" data-type="VE" class="btn btn-success add-to-cart">Xóa</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="col-12">
                <form class="form-horizontal dailyaspirants-login-page lg-container" role="form" action="#" method="post">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-3">		          	
                                    <label class="control-label">Tổng tiền</label>
                                    <label class="control-label">10000</label>		            		            		            
                                </div>
                                <div class="col-3">		          	
                                    <label class="control-label">Tiền cọc (10%)</label>
                                    <label class="control-label">1000</label>		            		            		            
                                </div>
                                <div class="col-2">
                                    <a href="${pageContext.request.contextPath}/booking/list.html" class="btn btn-info form-control" >Chọn thêm sân</a>	            		            		            
                                </div>
                                <div class="col-2">
                                    <a class=" btn btn-success form-control" >Xác nhận</a>	            		            		            
                                </div> 
                            </div>
                        </div>
                    </div>				    	
                </form>	  
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
                    "searching": false,
                    "lengthChange": false,
                    "paging":   false,
                    "ordering": false,
                });
                
                $('.create-stuff').validate({
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    rules: {
                        "point": {
                            required: true,
                            number: true,
                            min: 0,
                        },
                        "quantity": {
                            required: true,
                            number: true,
                            min: 0,
                        }
                    },
                    messages: {
                        "point": {
                            required: "Bắt buộc nhập nhập điểm đổi",
                            number: "Sai định dạng số",
                            min: "Giá trị phải lớn hơn 0"
                        },
                        "quantity": {
                            required: "Bắt buộc nhập số lượng",
                            number: "Số lượng phải là số nguyên",
                            min: "Giá trị phải lớn hơn 0"
                        }
                    },
                    errorPlacement: function(error, element) {
                        if (element.attr('name') == 'point') {
                            $("#error-point").text($(error).text());
                        } else if (element.attr('name') == 'quantity'){
                            $("#error-quantity").text($(error).text());
                        }
                    }
                });
                
                $('.create-stuff').on('submit', function(event) {
                    event.preventDefault();
                    let id = $(this).attr('value');
                    let type = $(this).attr('type');
                    let point = $('.create-stuff input[name=point]').val();
                    let quantity = $('.create-stuff input[name=quantity]').val();
                    
                    if ($(this).valid()) {
                        $.ajax({
                            type: 'post',
                            url: 'gifts/create.html',
                            mimeType:"text/html; charset=UTF-8",
                            data: {
                                id: id,
                                type: type,
                                point: point,
                                quantity: quantity,
                            },
                            dataType : 'json',
                        }).done(function(response) {
                            Swal.fire(response[0]);
                            $('.addtogift').modal('hide');
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            // If fail
                        });
                    }
                });
                
                $('.addtogift').on('hidden.bs.modal', function () {
                    $(this).find('input').val('').end();
                    $('#error-point').text('');
                    $('#error-quantity').text('');
                });
                
                $('.add-to-cart').on('click', function() {
                    let id = $(this).data('value');
                    let type = $(this).data('type');
                    let code = $(this).data('code');
                    let kind = $(this).data('kind');
                    $.ajax({
                        type: 'get',
                        url: 'cart/add.html',
                        mimeType:"text/html; charset=UTF-8",
                        dataType: 'json',
                        data: {
                            id: id,
                            type: type,
                            code: code,
                            kind: kind
                        }
                    }).done(function(response) {
                        if (response[0] == 200) {
                            Swal.fire(response[1]);
                            $('#cartNum').html(response[2]);
                        }
                    }).fail(function(response) {
                        Swal.fire("Hãy thử lại sau");
                    });
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            