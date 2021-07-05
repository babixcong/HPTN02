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
                    <c:if test="${pds.getKh() != null}">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="Họ" class="control-label">Họ</label>
                                    <input type="text" class="form-control" id="first_name" placeholder="Họ" disabled=""
                                        value="${pds.getKh().getHoten()}"
                                    >		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="Họ" class="control-label">CMT</label>
                                    <input type="text" class="form-control" id="first_name" placeholder="CMT" disabled=""
                                        value="${pds.getKh().getCmt()}"
                                    >		            		            		            
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="email" class="control-label">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Email" disabled=""
                                    value="${pds.getKh().getEmail()}"       
                                    >		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="phone" class="control-label">Điện thoại</label>
                                    <input type="email" class="form-control" id="email" placeholder="Số điện thoại" disabled=""
                                        value="${pds.getKh().getSdt()}"
                                   >		            		            		            
                                </div> 
                            </div>
                        </div>
                    </div>
                    </c:if>
                    
                    <c:if test="${pds.getKh() == null}">
                        Chưa chọn khách hàng
                    </c:if>
                </form>
            </div>
            <div class="data-tables datatable-primary">
                <form>
                    <table id="table-ve" class="text-center">
                        <thead class="text-capitalize">
                            <tr>
                                <th>STT</th>
                                <th>Mã sân</th>
                                <th>Tên sân</th>
                                <th>Loại sân</th>
                                <th>Giờ bắt đầu</th>
                                <th>Giờ kết thúc</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Đơn giá</th>
                            </tr>
                        </thead>
                        <c:forEach var="item" items="${pds.getListLichthue()}" varStatus="loop">
                            <tr id="r-${loop.index + 1}">
                                <td class="text-center">${loop.index +  1}</td>
                                <td class="text-left">${item.getSan().getId()}</td>
                                <td>${item.getSan().getTen()}</td>
                                <td>${item.getSan().getLoaisan()}</td>
                                <td><input value="${item.getCheckinHour()}" type="time" /></td>
                                <td><input value="${item.getCheckoutHour()}" type="time" /></td>
                                <td><input value="${item.getCheckinDate()}" type="date" /></td>
                                <td><input value="${item.getCheckoutDate()}" type="date" /></td>
                                <td>
                                    <input type="hidden" value="${item.getSan().getGiathue()}" />
                                    <span class="number priceformat">${item.getSan().getGiathue()} đ</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>
            <div class="col-12">
                <form class="form-horizontal dailyaspirants-login-page lg-container" role="form" action="#" method="post">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-3">		          	
                                    <label class="control-label">Tổng tiền</label>
                                    <input type="text" id="tongtien" disabled="" value="" placeholder="${pds.getTongtien()} đ" />
                                </div>
                                <div class="col-3">		          	
                                    <label class="control-label">Tiền cọc (10%)</label>
                                    <input type="text" id="tiencoc" disabled="" value="" placeholder="${pds.getTiencoc()} đ" />	            		            		            
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-success" id="tro-ve">OK</button>	            		            		            
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-ve').DataTable( {
                    "searching": false,
                    "lengthChange": false,
                    "paging":   false,
                    "ordering": false,
                });
                
                $('#tro-ve').on('click', function() {
                    
                    Swal.fire({
                        title: 'Thành công',
                        icon: 'success',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                      }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "index.html";
                        }
                      })
                });
            })
        </script>
    </jsp:attribute>
</mt:layout>