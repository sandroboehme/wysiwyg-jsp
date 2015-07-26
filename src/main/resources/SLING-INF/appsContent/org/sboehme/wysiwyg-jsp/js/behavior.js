		
		function writeNewText(){
			$.ajax({
				type: "POST",
				url: "/apps/org/sboehme/wysiwyg-jsp/html.jsp",
				success: function( data ) {
					alert("text "+data);
					// refresh the page
					//window.location.href=window.location.href;
				},
				data: { ":operation": "modify-jsp" },
				dataType: "text"
				});
		}
		function makeContainerSortable(){
//			items: ".component",
//				handle: ".drag",
//			cancel: ".component-container:not(.component)",
//		    receive: function (event, ui) {
//		    	$(ui.item).data("drop-succesful", true);
//		    	var lastId = $("#page-preview").attr("data-last-id");
//		    	lastId++;
//		    	$(ui.helper).attr("id", "cms_"+lastId);
//		    	$("#page-preview").attr("data-last-id",lastId);
//		    },
//		    stop: function (event, ui) {
//		    	if (!ui.item.next().hasClass("component")) {
//		    		$(this).sortable("cancel");
//		    	}
//		    }
			// see: http://jsfiddle.net/vdun28bj/31/
			// http://stackoverflow.com/questions/31613338/jquery-ui-sortable-cancel-option-for-multiple-nested-levels
			
			// http://jericho.htmlparser.net/docs/index.html
		    $( "#preview_example .component-container" ).sortable({
				connectWith: "#preview_example .component-container",
			    cancel: "#preview_example .component-container > :not(.component,.component-container)"
		    });
		    $( "#page-preview.component-container, #page-preview .component-container" ).sortable({
				connectWith: "#page-preview .component-container",
				handle: ".drag",
			    cancel: "#page-preview .component-container > :not(.component,.component-container)",
				tolerance: "pointer",
			    receive: function (event, ui) {
			    	$(ui.item).data("drop-succesful", true);
			    	var lastId = $("#page-preview").attr("data-last-id");
			    	lastId++;
			    	$(ui.helper).attr("id", "cms_"+lastId);
			    	$("#page-preview").attr("data-last-id",lastId);
			    	
			    	$(ui.helper).removeAttr("style");
			    }
		    });
		}
		
		$( document ).ready(function() {
			
			makeContainerSortable();
			var dragged=false;
			$(".component-label").draggable({
				connectToSortable: ".component-container",
				helper: "clone",
				handle: ".drag",
				tolerance: "pointer",
				start: function( event, ui ) {
					var componentId = $(this).attr("data-component-id");
					var newComponent = $("#"+componentId).clone();
					newComponent.removeAttr("id");
					ui.helper.empty();
					ui.helper.append(newComponent);
					ui.helper.removeClass();
					ui.helper.addClass("component");
				},
				stop: function(event, ui){
					makeContainerSortable();
				}
			});
			$("body .component-container > :not(.component,.component-container)").css("color","red");
			/*
			 */
		});