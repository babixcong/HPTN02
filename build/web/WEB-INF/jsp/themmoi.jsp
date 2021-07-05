<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Thêm mới khách hàng">
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
                <form class="form-horizontal dailyaspirants-login-page lg-container create-cus" role="form" action="#" method="post">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">		          	
                                    <label for="Họ" class="control-label">Họ</label>
                                    <input type="text" class="form-control" name="ho" id="ho" placeholder="Họ">
                                    <div class="text-danger" id="error-ho"></div>
                                </div>  
                                <div class="col-md-4">		          	
                                    <label for="Đệm" class="control-label">Đệm</label>
                                    <input type="text" class="form-control" name="dem" id="dem" placeholder="Đệm" required>
                                    <div class="text-danger" id="error-dem"></div>
                                </div> 
                                <div class="col-md-4">		          	
                                    <label for="Tên" class="control-label">Tên</label>
                                    <input type="text" class="form-control" name="ten" id="ten" placeholder="Tên" required>
                                    <div class="text-danger" id="error-ten"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">		          	
                                    <label for="email" class="control-label">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>		            		            		            
                                    <div class="text-danger" id="error-email"></div>
                                </div>
                                <div class="col-md-4">		          	
                                    <label for="phone" class="control-label">Điện thoại</label>
                                    <input type="number" class="form-control" name="sdt" id="sdt" placeholder="Số điện thoại" required>		            		            		            
                                    <div class="text-danger" id="error-sdt"></div>
                                </div>
                                <div class="col-md-4">		          	
                                    <label class="control-label">CMT</label>
                                    <input type="number" class="form-control" name="cmt" id="cmt" placeholder="Chứng minh thư" required>		            		            		            
                                    <div class="text-danger" id="error-cmt"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">		          	
                                    <label  class="control-label">Số nhà</label>
                                    <input type="text" class="form-control" id="sonha" placeholder="Số nhà">		            		            		            
                                </div>
                                <div class="col-md-2">		          	
                                    <label class="control-label">Phố</label>
                                    <input type="text" class="form-control" id="pho" placeholder="Phố">		            		            		            
                                </div>
                                <div class="col-md-2">		          	
                                    <label class="control-label">Phường</label>
                                    <input type="text" class="form-control" id="phuong" placeholder="Phường">		            		            		            
                                </div>
                                <div class="col-md-2">		          	
                                    <label class="control-label">Quận</label>
                                    <input type="text" class="form-control" id="quan" placeholder="Quận">		            		            		            
                                </div>
                                <div class="col-md-2">		          	
                                    <label class="control-label">Thành phố</label>
                                    <input type="text" class="form-control" id="thanhpho" placeholder="Thành phố">		            		            		            
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-2">
                                    <button type="submit" id="create-kh" class="btn btn-info" >Thêm mới</button>
                                </div>
                                <div class="col-2">
                                    <button type="button" id="cancel" class="btn btn-danger" >Hủy</button>
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
                    columnDefs: [ { orderable: false, targets: [3, 4, 5] }],
                });
                
                $('.create-cus').validate({
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    rules: {
                        "ho": {
                            required: true
                        },
                        "dem": {
                            required: true
                        },
                        "ten": {
                            required: true
                        },
                        "sdt": {
                            required: true,
                            number: true
                        },
                        "email": {
                            required: true
                        },
                        "cmt": {
                            required: true,
                            number: true
                        }
                    },
                    messages: {
                        "cmt": {
                            required: "Bắt buộc nhập chứng minh thư",
                            number: "Sai định dạng số"
                        },
                        "sdt": {
                            required: "Bắt buộc nhập nhập số điện thoại",
                            number: "Sai định dạng số"
                        },
                        "ho": {
                            required: "Bắt buộc nhập họ",
                        },
                        "dem": {
                            required: "Bắt buộc nhập đệm",
                        },
                        "ten": {
                            required: "Bắt buộc nhập tên",
                        },
                        
                    },
                    errorPlacement: function(error, element) {
                        if (element.attr('name') == 'ho') {
                            $("#error-ho").text($(error).text());
                        } else if (element.attr('name') == 'dem'){
                            $("#error-dem").text($(error).text());
                        } else if (element.attr('name') == 'ten'){
                            $("#error-ten").text($(error).text());
                        } else if (element.attr('name') == 'sdt'){
                            $("#error-sdt").text($(error).text());
                        } else if (element.attr('name') == 'cmt'){
                            $("#error-cmt").text($(error).text());
                        } else if (element.attr('name') == 'email'){
                            $("#error-email").text($(error).text());
                        }
                    }
                });
                
                $('.create-cus').on('submit', function(event) {
                    event.preventDefault();
                    let ho = $('#ho').val();
                    let dem = $('#dem').val();
                    let ten = $('#ten').val();
                    let email = $('#email').val();
                    let sdt = $('#sdt').val();
                    let cmt = $('#cmt').val();
                    let sonha = $('#sonha').val();
                    let pho = $('#pho').val();
                    let phuong = $('#phuong').val();
                    let quan = $('#quan').val();
                    let thanhpho = $('#thanhpho').val();
                    
                    if ($(this).valid()) {
                        $.ajax({
                            type: 'post',
                            url: 'customers/store.html',
                            mimeType:"text/html; charset=UTF-8",
                            data: {
                                ho: ho,
                                ten: ten,
                                dem: dem,
                                email: email,
                                sdt: sdt,
                                cmt: cmt,
                                sonha: sonha,
                                pho: pho,
                                phuong: phuong,
                                quan: quan,
                                thanhpho: thanhpho
                            },
                            dataType : 'json',
                        }).done(function(response) {
                            Swal.fire("Thêm thành công!");
                            window.history.back();
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            Swal.fire("Có lỗi xảy ra");
                        });
                    }
                });
                
                $('#cancel').on('click', function() {
                    window.history.back();
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            