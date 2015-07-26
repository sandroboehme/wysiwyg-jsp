<!DOCTYPE html>

<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page import="javax.jcr.*,org.apache.sling.api.resource.Resource"%>
<%@ page import="java.security.Principal"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<sling:defineObjects />
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>WYSIWYG JSP proof of concepts</title>

    <!-- Bootstrap -->
	<link href="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/3rdparty/bootstrap.css" rel="stylesheet">
    
	<!--  jQuery UI for the sortable jQuery plugin -->
	<link href="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/3rdparty/jquery-ui.css" rel="stylesheet">
	
	
	<link href="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/css/style.css" rel="stylesheet">
	

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	  <div class="container-fluid">
		<div class="row">
			<div class="col-md-2 sidebar-container">
	 			<div class="component-label"><h4>Web Component Palette</h4></div>
 				<div class="component-label" data-component-id="bs-row-4-4-4">Row 4-4-4 <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-row-12">Row 12 <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-button">Button <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-p">Paragraph <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-h1">H1 <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-navbar">Navbar <span class="drag small">-drag me-</span></div>
	 			<div class="component-label" data-component-id="bs-carousel">Carousel <span class="drag small">-drag me-</span></div>
			</div>
			<div id="page-preview" class="col-md-10 component-container" data-last-id="2">
				<div id="cms_0" class="component"><div class="drag">drag me</div>
					<div class="row">
						  <div class="col-md-4 component-container"><p>Paragraph</p></div>
						  <div class="col-md-4 component-container">
								<div id="cms_1" class="component" data-component-id="bs-button">
									<div>
										<div class="drag">drag me</div>
										<button type="button" class="btn btn-success">Success</button>
									</div>
								</div>
								<p>Paragraph</p>
							</div>
						  <div class="col-md-4 component-container">
						  	<p>Paragraph</p>
							<div id="cms_2" class="component" data-component-id="bs-button">
								<div>
									<div class="drag">drag me</div>
									<button type="button" class="btn btn-success">Success</button>
								</div>
							</div>
						  </div>
					</div>
				</div>
			</div>

		</div>
		
	  </div> <!-- End container-fluid -->
	<div class="component-stock">
		<div id="bs-row-4-4-4"><div class="drag">drag me</div>
			<div class="row">
				  <div class="col-md-4 component-container"></div>
				  <div class="col-md-4 component-container"></div>
				  <div class="col-md-4 component-container"></div>
			</div>
		</div>
		<div id="bs-row-12"><div class="drag">drag me</div>
			<div class="row">
				  <div class="col-md-12 component-container"></div>
			</div>
		</div>
		<div id="bs-h1"><div class="drag">drag me</div><h1>h1. Bootstrap heading</h1></div> 
		<div id="bs-p"><div class="drag">drag me</div><p>Paragraph</p></div>
		<div id="bs-button"><div class="drag">drag me</div><button type="button" class="btn btn-success">Success</button></div>
	</div>
<hr>
	<input onclick="writeNewText();" type="button" value="Write new text!">
	<div>Some other jcrbrowser text.</div>
	<div id="new-text-id"></div>
	
	    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/3rdparty/jquery.js"></script>
	<!--  jQuery UI for the sortable jQuery plugin -->
	<script type="text/javascript" src="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/3rdparty/jquery-ui.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/3rdparty/bootstrap.min.js"></script>
	
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/apps/org/sboehme/wysiwyg-jsp/js/behavior.js"></script>

</body>
</html>