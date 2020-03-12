<?php
  global $data;
  if ($data['blogtype'] == 1) {
      include('category_template1.php');
  } else {
      include('blog_page_2_column.php');
	 }
?>