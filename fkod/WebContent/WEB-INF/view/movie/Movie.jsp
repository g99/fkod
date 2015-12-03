<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="movie_wrap"  ></div>

<script src="${context}/js/global.js"></script>
<script type="text/javascript">

$(function() {
	$('#movie_wrap').css('margin-left', '100px').css('border-collapse', 'collapse');
	Movie.ranking("${context}");
});

</script>