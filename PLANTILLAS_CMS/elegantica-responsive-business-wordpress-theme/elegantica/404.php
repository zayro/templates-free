<?php get_header(); ?>

<div class = "outerpagewrap error404">
	<div class="pagewrap">
		<div class="pagecontent">
			<div class="pagecontentContent">
				<h1><?php echo stripText($data['errorpagetitle']) ?></h1>
				<p><?php echo stripText($data['errorpagesubtitle']) ?></p>
			</div>
			<div class="homeIcon"><a href="<?php echo home_url(); ?>"></a></div>
		</div>

	</div>
</div>
			
<div id="mainwrap">

	<div id="main" class="clearfix">
	

	<div class="pad"></div>

					<div class="content fullwidth errorpage">
							<div class="postcontent">
								<h2><?php echo stripText($data['errorpagetitle']) ?></h2>
								<div class="posttext">
									<?php echo stripText($data['errorpage']) ?>
								</div>
								<div class="homeIcon"><a href="<?php echo home_url(); ?>"></a></div>
							</div>							
					</div>
	</div>
</div>

<?php get_footer(); ?>
