<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="movie_wrap"  ></div>

<script type="text/javascript">

$(function() {
	Movie.ranking("${context}");
});

</script>