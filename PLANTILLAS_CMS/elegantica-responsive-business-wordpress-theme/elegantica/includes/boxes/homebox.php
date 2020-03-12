<!-- box home page for 4 intro boxes -->
	<div class = "homeBoxAll">
		<div class="homeBox">
			<div class="one_fourth">
				<a href="<?php echo $data['box1_link']?>">
				<div class = "boxImage">
					<div class="imagerecentholder">
						<img src="<?php if ($data['box1_image']!='') echo $data['box1_image']; else echo get_template_directory_uri().'/images/placeholder-580-small.png';?>" alt="<?php echo stripText($data['box1_title'])?>">
					</div>	
				</div>	
				</a>
				<div class="boxdescwraper">
					<h2><a href="<?php echo $data['box1_link']?>"><?php echo stripText($data['box1_title'])?> <span><?php echo stripText($data['box1_description'])?></span></a></h2>	
				</div>				
			</div>
			<div class="one_fourth">
				<a href="<?php echo $data['box2_link']?>">
				<div class = "boxImage">
					<div class="imagerecentholder">
						<img src="<?php if ($data['box2_image']!='') echo $data['box2_image']; else echo get_template_directory_uri().'/images/placeholder-580-small.png';?>" alt="<?php echo stripText($data['box2_title'])?>">
					</div>	
				</div>
				</a>
				<div class="boxdescwraper">				
					<h2><a href="<?php echo $data['box2_link']?>"><?php echo stripText($data['box2_title'])?><span><?php echo stripText($data['box2_description'])?></span></a></h2>
				</div>				
			</div>
			<div class="one_fourth">	
				<a href="<?php echo $data['box3_link']?>">
				<div class = "boxImage">
					<div class="imagerecentholder">
						<img src="<?php if ($data['box3_image']!='') echo $data['box3_image']; else echo get_template_directory_uri().'/images/placeholder-580-small.png';?>" alt="<?php echo stripText($data['box3_title'])?>">
					</div>
				</div>	
				</a>
				<div class="boxdescwraper">				
					<h2><a href="<?php echo $data['box3_link']?>"><?php echo stripText($data['box3_title'])?><span><?php echo stripText($data['box3_description'])?></span></a></h2>
				</div>
			</div>
			
			<div class="one_fourth last">
				<a href="<?php echo $data['box4_link']?>">
				<div class = "boxImage">
					<div class="imagerecentholder">
						<img src="<?php if ($data['box4_image']!='') echo $data['box4_image']; else echo get_template_directory_uri().'/images/placeholder-580-small.png';?>" alt="<?php echo stripText($data['box4_title'])?>">
					</div>
				</div>	
				</a>
				<div class="boxdescwraper">				
					<h2><a href="<?php echo $data['box4_link']?>"><?php echo stripText($data['box4_title'])?><span><?php echo stripText($data['box4_description'])?></span></a></h2>

				</div>
			</div>
		</div>
	</div>

		
		<div class="clear"></div>	