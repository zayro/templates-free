<?php
/**
 * The Template for displaying product archives, including the main shop page which is a post type archive.
 *
 * Override this template by copying it to yourtheme/woocommerce/archive-product.php
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */
?>



<div class="row">
    <div class="fifteen columns" id="page-title">
        <a class="back" href="javascript:history.back()"></a>
        <div class="subtitle">
            <?php do_action( 'woocommerce_archive_description' ); ?>

            <?php if ( is_tax() ) : ?>
            <?php do_action( 'woocommerce_taxonomy_archive_description' ); ?>
            <?php elseif ( ! empty( $shop_page ) && is_object( $shop_page ) ) : ?>
            <?php do_action( 'woocommerce_product_archive_description', $shop_page ); ?>
            <?php endif; ?>
            <?php $shop_page = get_post( woocommerce_get_page_id( 'shop' ));
            echo cr_excerpt_by_id($shop_page);
            ?>
        </div>
        <h1 class="page-title">
            <?php if ( is_search() ) : ?>
            <?php
            printf( __( 'Search Results: &ldquo;%s&rdquo;', 'woocommerce' ), get_search_query() );
            if ( get_query_var( 'paged' ) )
                printf( __( '&nbsp;&ndash; Page %s', 'woocommerce' ), get_query_var( 'paged' ) );
            ?>
            <?php elseif ( is_tax() ) : ?>
            <?php echo single_term_title( "", false ); ?>
            <?php else : ?>
            <?php
            $shop_page = get_post( woocommerce_get_page_id( 'shop' ) );

            echo apply_filters( 'the_title', ( $shop_page_title = get_option( 'woocommerce_shop_page_title' ) ) ? $shop_page_title : $shop_page->post_title );
            ?>
            <?php endif; ?>
        </h1>

        <div class="breadcrumbs"><?php if (function_exists('dimox_breadcrumbs')) dimox_breadcrumbs(); ?></div>

    </div>
    <div class="fifteen columns"><div class="line"></div></div>
</div>


<div class="row">
    <div class="eleven columns">

        <?php
        /**
         * woocommerce_before_main_content hook
         *
         * @hooked woocommerce_output_content_wrapper - 10 (outputs opening divs for the content)
         * @hooked woocommerce_breadcrumb - 20
         */
        do_action('woocommerce_before_main_content');
        ?>



        <?php while ( have_posts() ) : the_post(); ?>

        <?php woocommerce_get_template_part( 'content', 'single-product' ); ?>

        <?php endwhile; // end of the loop. ?>

        <div class="clear"></div>

        <?php
        /**
         * woocommerce_pagination hook
         *
         * @hooked woocommerce_pagination - 10
         * @hooked woocommerce_catalog_ordering - 20
         */
        do_action( 'woocommerce_pagination' );
        ?>

        <?php
        /**
         * woocommerce_after_main_content hook
         *
         * @hooked woocommerce_output_content_wrapper_end - 10 (outputs closing divs for the content)
         */
        do_action('woocommerce_after_main_content');
        ?>

    </div>
    <div class="four columns">

        <?php
        /**
         * woocommerce_sidebar hook
         *
         * @hooked woocommerce_get_sidebar - 10
         */
        do_action('woocommerce_sidebar');
        ?>

    </div>
</div>