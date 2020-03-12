<?php global $data; ?>
<!-- START FOOTER-->
<footer id="footer">
    <div class="sub-footer">
        <div class="container">
            <div class="row clearfix">
                <div class="copyright"><?php echo $data['copyrighttext']; ?></div>
                <div class="to-top"><a class="pager-item anchorLink" style="cursor:pointer;"><?php _e('TOP', 'themeton'); ?></a></div>
            </div>
        </div>
    </div>
</footer>
<!-- END FOOTER -->
</div>
<!-- End Wrapper -->
<?php wp_footer(); ?>
<?php
/*Google Analytics Code*/
if ($data['google_analytics']) {
    echo stripslashes($data['google_analytics']);
}
?>
</body>
</html>