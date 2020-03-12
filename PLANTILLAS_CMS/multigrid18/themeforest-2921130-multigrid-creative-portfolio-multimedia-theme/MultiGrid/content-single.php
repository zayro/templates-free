<?php
    global $blogConf, $single_content_type, $data, $social_position;
    
    $single_content_type[0]=isset($single_content_type[0])?$single_content_type[0]:'item';
    $single_content_type[1]=isset($single_content_type[1])?$single_content_type[1]:'meta'; ?>
<!-- Start Page -->
<section id="page" class="clearfix">
    <div class="single-no-ajax">
        <div class="single-container clearfix">
            
            <div class="<?php echo $single_content_type[0]; ?>-single item-not-inited">
                <?php if (is_single() || $blogConf['hide_pagetitle'] || (isset($blogConf['teaser_text'])&&$blogConf['teaser_text']!='')){ ?>
                    <header id="<?php echo $single_content_type[0]; ?>-single-title-1" class="clearfix">
                        <?php if(is_single() || $blogConf['hide_pagetitle']) { ?>
                            <h2 class="item-title"><a href="<?php the_permalink(); ?>" title="<?php printf(esc_attr__('%s', 'themeton'), the_title_attribute('echo=0')); ?>"><?php the_title(); ?></a></h2><?php
                        }
                        if($single_content_type[1] == 'meta'){
                            if(!isset($blogConf['post_meta']) || !$blogConf['post_meta']){ ?>
                                <span class="item-single-meta"><a><?php echo human_time_diff( get_the_time('U'), current_time('timestamp') ); _e(' ago','themeton'); ?></a> <?php _e('by','themeton'); ?> <?php  the_author_posts_link(); ?> <?php _e('in','themeton'); ?> <?php the_category(', '); ?></span><?php
                            }                    
                        }
                        if (isset($blogConf['teaser_text']) && $blogConf['teaser_text'] != ''){ ?>
                            <div class="page-teaser">
                                <p><?php echo do_shortcode($blogConf['teaser_text']); ?></p>
                            </div><?php
                        } ?>
                    </header>
                <?php } ?>
                <!-- Social Integrate -->
                <?php if ($social_position[$data['social_position']] == 'top') get_template_part('post', 'socials'); ?>
                <section>
                    <?php
                        if(!isset($blogConf['image_hide']) || !$blogConf['image_hide'])
                            get_template_part('post', 'featuredimage'); 
                    ?>
                    <div class="item-content">
                        <?php the_content(); ?>
                        <?php get_template_part('post', 'edit'); ?>
                    </div>
                    <!-- Social Integrate -->
                    <?php if ($social_position[$data['social_position']] != 'top') get_template_part('post', 'socials'); ?>
                    <?php get_template_part('post', 'author'); ?>
					<?php if(is_mobile()) tt_prev_next_post(); ?>
                    <?php get_template_part('post', 'comment'); ?>
                    
                </section>
            </div>
            
            <?php get_sidebar(); ?>
        </div>
    </div>
</section>
<!-- End Page -->